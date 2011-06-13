//
//  KBShowToolBoxBigEvent.m
//  HarvestMoon
//
//  Created by Patrick Borgogno on 13.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBShowToolBoxBigEvent.h"


@implementation KBShowToolBoxBigEvent
@synthesize hasFinishedRunning;

-(id)initWithObject:(NSDictionary *)object
{
    if ((self = [super init])) 
    {
    }
    
    return self;
}

-(RunOnEvent) runsOnEvent
{
    return TouchedWithFinger;
}

-(void)run
{
}

@end
