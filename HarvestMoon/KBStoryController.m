//
//  KBStoryController.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 22.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBStoryController.h"
#import "KBGameLayer.h"
#import "KBStandardGameController.h"
#import "KBPlayer.h"
#import "KBConfigurationManager.h"

@implementation KBStoryController

static KBStoryController* _sharedSingleton;

#pragma mark -
#pragma mark Properties

@synthesize lastSavedPlayerPosition = _lastSavedPlayerPosition;

@synthesize currentMapName = _currentMapName;

#pragma mark -
#pragma mark Class Methods

+ (void) initialize
{
    static BOOL initialized = NO;
    if(!initialized)
    {
        initialized = YES;
        _sharedSingleton = [[KBStoryController alloc] init];
    }
}

+ (KBStoryController *) sharedController
{
    return _sharedSingleton;
}

#pragma mark -
#pragma mark Init & Dealloc

- (id)init {
    self = [super init];
    if (self) {
        self.lastSavedPlayerPosition = ccp(400,300);
        
        self.currentMapName = kJacksHouseMap;
        
        [self loadGameState];
        
    }
    return self;
}

#pragma mark -
#pragma mark Save Game State

-(void)updateValues
{
    KBGameLayer* gl = [[KBStandardGameController sharedController] gameLayer];
    KBPlayer* player = [[KBStandardGameController sharedController] player];
    
    self.lastSavedPlayerPosition = [player position];
    self.currentMapName = gl.map.mapName;
}

- (void)saveGameState
{
    [self updateValues];
    
    [[[KBConfigurationManager sharedManager] configuration] setObject:NSStringFromCGPoint([[KBStandardGameController sharedController] player].position) forKey:kLastSavedPlayerPosition];
    
    [[[KBConfigurationManager sharedManager] configuration] setObject:[[KBStandardGameController sharedController] gameLayer].map.mapName forKey:kCurrentMapName];
}

- (void) loadGameState
{
    if ([[KBConfigurationManager sharedManager] stringForKey:kLastSavedPlayerPosition] != nil) {
        [[KBStandardGameController sharedController] player].position = CGPointFromString([[KBConfigurationManager sharedManager] stringForKey:kLastSavedPlayerPosition]);
    }
    
    if ([[KBConfigurationManager sharedManager] stringForKey:kCurrentMapName] != nil) {
        [[[KBStandardGameController sharedController] gameLayer].map initWithMapName:[[KBConfigurationManager sharedManager] stringForKey:kCurrentMapName]];
    }
}

#pragma mark -

@end
