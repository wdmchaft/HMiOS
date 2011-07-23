//
//  KBJumpToMapEvent.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 26.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBJumpToMapEvent.h"
#import "ScriptingIdentifiers.h"
#import "KBStandardGameController.h"
#import "KBGameLayer.h"

#pragma mark -
#pragma mark Implementation

@implementation KBJumpToMapEvent

#pragma mark -
#pragma mark Properties

@synthesize mapName = _mapName;

@synthesize hasFinishedRunning;

@synthesize playerPos=_playerPos;

#pragma mark -
#pragma mark State Handling

-(id)initWithObject:(NSDictionary *)object
{
    self = [super init];
    if (self) {
        
        self.mapName = [object valueForKey:kMapNameProperty];
        self.playerPos = ccp([[object valueForKey:kPositionX] integerValue],[[object valueForKey:kPositionY] integerValue]);
    }
    return self;
}

#pragma mark -
#pragma mark Event Handling

-(void)run
{
    KBGameLayer* gameLayer = (KBGameLayer *)[[KBStandardGameController sharedController] gameLayer];
    
    [gameLayer.map save];
    [gameLayer loadMap:[self.mapName stringByAppendingString:@".tmx"] playerPosition:self.playerPos withAnimation:YES];
    
    self.hasFinishedRunning = YES;
}

-(RunOnEvent) runsOnEvent
{
    return TouchedByPlayer;
}

#pragma mark -

@end
