//
//  KBShowToolBoxBigEvent.h
//  HarvestMoon
//
//  Created by Patrick Borgogno on 13.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "KBEvent.h"

@interface KBShowToolBoxBigEvent : NSObject <KBEvent> {
    
}

@property(nonatomic) int toolboxHeightInObjects;
@property(nonatomic) int toolboxWidthInObjects;
@property(nonatomic) int toolboxOuterSpacing;
@property(nonatomic) int toolboxInnerSpacing;

-(id)initWithObject:(NSDictionary *)object;
-(RunOnEvent) runsOnEvent;
-(void) run;

@end
