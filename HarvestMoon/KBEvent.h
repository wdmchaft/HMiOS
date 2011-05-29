//
//  KBScript.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 24.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    TouchedByPlayer = 1,
    TouchedWithFinger = 2
} RunOnEvent;

@protocol KBEvent <NSObject>
@required
@property(nonatomic) BOOL hasFinishedRunning;


-(RunOnEvent) runsOnEvent;
-(void) run;
-(id)initWithObject:(NSDictionary *)object;
@end
