//
//  KBMainMenuScene.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 12.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "KBGameLayer.h"
#import "KBOptionsScreen.h"

#pragma mark -
#pragma mark Interface

@interface KBMainMenuLayer : CCLayer {
    
}

#pragma mark -
#pragma mark State Handling

-(id)init;

#pragma mark -
#pragma mark Menu Handling

-(void)newGame;

-(void)continueGame;

-(void)showOptionScreen;

#pragma mark -

@end
