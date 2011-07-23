//
//  KBScript.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 24.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark -
#pragma mark RunOnEvent Enum

typedef enum {
    TouchedByPlayer = 1,
    TouchedWithFinger = 2
} RunOnEvent;

#pragma mark -
#pragma mark Protocol

@protocol KBEvent <NSObject>

#pragma mark -
#pragma mark Required Elements

@required

@property(nonatomic) BOOL hasFinishedRunning;

-(RunOnEvent) runsOnEvent;

-(void) run;

-(id)initWithObject:(NSDictionary *)object;

#pragma mark -

@end
