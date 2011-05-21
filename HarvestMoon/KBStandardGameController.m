//
//  StandardGameController.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 15.05.11.
//  Copyright 2011 KBDevers. All rights reserved.
//

#import "KBStandardGameController.h"

@implementation KBStandardGameController

static KBStandardGameController *sharedSingleton;

#pragma mark -
#pragma mark Properties

@synthesize gameLayer = _gameLayer;

#pragma mark -
#pragma mark Class Methods

+ (void) initialize
{
    static BOOL initialized = NO;
    if(!initialized)
    {
        initialized = YES;
        sharedSingleton = [[KBStandardGameController alloc] init];
    }
}

+ (KBStandardGameController *) sharedController
{
    return sharedSingleton;
}

#pragma mark -

@end
