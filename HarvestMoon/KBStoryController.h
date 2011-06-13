//
//  KBStoryController.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 22.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameConfig.h"
#import "cocos2d.h"

@interface KBStoryController : NSObject
{

    CGPoint _lastSavedPlayerPosition;
    
    NSString* _currentMapName;

}

#pragma mark -
#pragma mark Properties

@property (nonatomic) CGPoint lastSavedPlayerPosition;

@property (nonatomic, retain) NSString* currentMapName;

#pragma mark -
#pragma mark Class Methods

+ (void) initialize;

+ (KBStoryController *) sharedController;

#pragma mark -
#pragma mark Init & Dealloc

- (id) init;

#pragma mark -
#pragma mark Save Game State

- (void) saveGameState;

- (void) loadGameState;

- (void) updateValues;

#pragma mark -

@end
