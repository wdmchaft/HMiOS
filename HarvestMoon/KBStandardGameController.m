//
//  StandardGameController.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 15.05.11.
//  Copyright 2011 KBDevers. All rights reserved.
//

#import "KBStandardGameController.h"
#import "KBPlayer.h"
#import "KBGameLayer.h"


@implementation KBStandardGameController

static KBStandardGameController* _sharedSingleton;

#pragma mark -
#pragma mark Properties

@synthesize gameLayer = _gameLayer;

@synthesize player = _player;

#pragma mark -
#pragma mark Class Methods

+ (void) initialize
{
    static BOOL initialized = NO;
    if(!initialized)
    {
        initialized = YES;
        _sharedSingleton = [[KBStandardGameController alloc] init];
    }
}

+ (KBStandardGameController *) sharedController
{
    return _sharedSingleton;
}

#pragma mark -

@end
