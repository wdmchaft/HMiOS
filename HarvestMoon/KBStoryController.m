//
//  KBStoryController.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 22.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBStoryController.h"

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
        //self.currentMapName = kCentering_Test;
        
        [self readFromNSUserDefaults];
        
    }
    return self;
}

#pragma mark -
#pragma mark Save Game State

- (void)saveGameState
{
    
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
