//
//  StandardGameController.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 15.05.11.
//  Copyright 2011 KBDevers. All rights reserved.
//

#import "KBStandardGameController.h"


@implementation KBStandardGameController
@synthesize gameLayer=_gameLayer;
static KBStandardGameController *sharedSingleton;

+ (void)initialize
{
    static BOOL initialized = NO;
    if(!initialized)
    {
        initialized = YES;
        sharedSingleton = [[KBStandardGameController alloc] init];
    }
}


+(KBStandardGameController *)sharedController
{
    return sharedSingleton;
}

@end
