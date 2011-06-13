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

}

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

- (void) setUpNewGame;

#pragma mark -

@end
