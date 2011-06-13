//
//  KBShowToolBoxBigEvent.m
//  HarvestMoon
//
//  Created by Patrick Borgogno on 13.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBShowToolBoxBigEvent.h"

@implementation KBShowToolBoxBigEvent
@synthesize toolboxHeightInObjects=_toolboxHeightInObjects;
@synthesize toolboxWidthInObjects=_toolboxWidthInObjects;
@synthesize toolboxOuterSpacing=_toolboxOuterSpacing;
@synthesize toolboxInnerSpacing=_toolboxInnerSpacing;
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

-(void) run
{
    int screenWidth = [[CCDirector sharedDirector] winSize].width - self.toolboxOuterSpacing;
    int screenHeight = [[CCDirector sharedDirector] winSize].height - self.toolboxOuterSpacing;
    int objectBoxWidth = screenWidth / self.toolboxWidthInObjects;
    int objectBoxHeight = screenHeight / self.toolboxHeightInObjects;
    int objectWidth = objectBoxWidth - self.toolboxInnerSpacing;
    int objectHeight = objectBoxHeight - self.toolboxInnerSpacing;
    
    CGPoint objectBoxPosition;
    CGPoint objectPosition;
    
    for (int y = 0; y < self.toolboxHeightInObjects; y++)
    {
        for (int x = 0; x < self.toolboxWidthInObjects; x++)
        {
            objectBoxPosition = CGPointMake(x * objectBoxWidth + self.toolboxOuterSpacing, y * objectBoxHeight + self.toolboxOuterSpacing);
            objectPosition = CGPointMake(objectBoxPosition.x + self.toolboxInnerSpacing, objectBoxPosition.y + self.toolboxInnerSpacing);
        }
    }
}

@end
