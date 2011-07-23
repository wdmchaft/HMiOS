//
//  KBJumpToMapEvent.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 26.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KBEvent.h"

#pragma mark -
#pragma mark Interface

@interface KBJumpToMapEvent : NSObject <KBEvent> {
    
#pragma mark -
#pragma mark Class Variables
    
    NSString* _mapName;
    
    CGPoint _playerPos;

}

#pragma mark -
#pragma mark Properties

@property(nonatomic,retain) NSString* mapName;

@property(nonatomic) CGPoint playerPos;

#pragma mark -
#pragma mark State Handling

-(id)initWithObject:(NSDictionary *)object;

#pragma mark -
#pragma mark Event Handling

-(RunOnEvent) runsOnEvent;

-(void)run;

#pragma mark -

@end
