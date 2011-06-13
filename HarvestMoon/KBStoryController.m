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
        [self loadGameState];
        
    }
    return self;
}

#pragma mark -
#pragma mark Save Game State

- (void)saveGameState
{
    [[[KBConfigurationManager sharedManager] configuration] setObject:NSStringFromCGPoint([[KBStandardGameController sharedController] player].position) forKey:kLastSavedPlayerPosition];
    
    [[[KBConfigurationManager sharedManager] configuration] setObject:[[KBStandardGameController sharedController] gameLayer].map.mapName forKey:kCurrentMapName];
    
    [[[KBConfigurationManager sharedManager] configuration] setObject:[[KBStandardGameController sharedController] player].inventory forKey:kInventory];
    
}

- (void) loadGameState
{
    if ([[KBConfigurationManager sharedManager] stringForKey:kLastSavedPlayerPosition] != nil) {
        [[KBStandardGameController sharedController] player].position = CGPointFromString([[KBConfigurationManager sharedManager] stringForKey:kLastSavedPlayerPosition]);
    }
    
    if ([[KBConfigurationManager sharedManager] stringForKey:kCurrentMapName] != nil) {
        [[[KBStandardGameController sharedController] gameLayer].map initWithMapName:[[KBConfigurationManager sharedManager] stringForKey:kCurrentMapName]];
    }
    
    if ([[[KBConfigurationManager sharedManager] configuration] objectForKey:kInventory] != nil) {
        [[KBStandardGameController sharedController] player].inventory = [[[KBConfigurationManager sharedManager] configuration] objectForKey:kInventory];
    }
}

- (void) setUpNewGame
{
    [[[KBConfigurationManager sharedManager] configuration] setObject:NSStringFromCGPoint(ccp(200,100)) forKey:kLastSavedPlayerPosition];
    
    [[[KBConfigurationManager sharedManager] configuration] setObject:@"Jacks_House.tmx" forKey:kCurrentMapName];
    
    KBInventory* inv = [[KBInventory alloc] init];
    
    KBItem* item = [[KBItem alloc] initWithDefinitionFile:@"can"];
    
    [inv addItem:item];
    
    [[[KBConfigurationManager sharedManager] configuration] setObject:inv forKey:kInventory];    
    
    [self loadGameState];
}

#pragma mark -

@end
