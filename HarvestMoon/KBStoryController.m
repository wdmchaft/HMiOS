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

#pragma mark -
#pragma mark Encoding Name Definitions

#define kLastSavedPlayerPosition @"LastSavedPlayerPosition" 

#define kCurrentMapName @"CurrentMapName"

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
        
        [self readFromNSUserDefaults];
        
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
    [[NSUserDefaults standardUserDefaults] setObject:NSStringFromCGPoint(self.lastSavedPlayerPosition) 
                                              forKey:kLastSavedPlayerPosition];
    
    [[NSUserDefaults standardUserDefaults] setObject:self.currentMapName forKey:kCurrentMapName];
    
}

- (void) readFromNSUserDefaults
{
    if([[NSUserDefaults standardUserDefaults] stringForKey:kLastSavedPlayerPosition] != nil)
        self.lastSavedPlayerPosition = 
            CGPointFromString([[NSUserDefaults standardUserDefaults] stringForKey:kLastSavedPlayerPosition]);
    
    if([[NSUserDefaults standardUserDefaults] stringForKey:kCurrentMapName] != nil)
        self.currentMapName = [[NSUserDefaults standardUserDefaults] stringForKey:kCurrentMapName];
    
}

#pragma mark -

@end
