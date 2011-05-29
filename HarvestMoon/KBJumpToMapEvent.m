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

@implementation KBJumpToMapEvent
@synthesize mapName = _mapName;
@synthesize hasFinishedRunning;

-(id)initWithObject:(NSDictionary *)object
{
    self = [super init];
    if (self) {
        self.mapName = [object valueForKey:kMapNameProperty];
    }
    return self;
}

-(void)run
{
    KBGameLayer* gameLayer = (KBGameLayer *)[[KBStandardGameController sharedController] gameLayer];
    
    [gameLayer loadMap:[self.mapName stringByAppendingString:@".tmx"] withAnimation:YES];
    self.hasFinishedRunning = YES;
}

-(RunOnEvent) runsOnEvent
{
    return TouchedByPlayer;
}

@end
