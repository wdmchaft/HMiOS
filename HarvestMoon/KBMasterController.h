//
//  KBMasterController.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 01.07.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "KBMainMenuLayer.h"
#import "KBInteractionHandler.h"
#import "KBGameMenuLayer.h"
#import "KBGameLayer.h"

#pragma mark -
#pragma mark Interface

@interface KBMasterController : CCNode {
    
#pragma mark -
#pragma mark Class Variables
    
    KBMainMenuLayer* _mainMenuLayer;
    
    KBGameLayer* _gameLayer;
    
    KBInteractionHandler* _interactionHandler;
    
    KBGameMenuLayer* _gameMenuLayer;
    
}

#pragma mark -
#pragma mark Properties

@property(nonatomic,retain) KBMainMenuLayer* mainMenuLayer;

@property(nonatomic,retain) KBGameLayer* gameLayer;

@property(nonatomic,retain) KBGameMenuLayer* gameMenuLayer;

@property(nonatomic,retain) KBInteractionHandler* interactionHandler;

#pragma mark -
#pragma mark State Handling

-(id)init;

#pragma mark -
#pragma mark Class Methods

+ (KBMasterController *) sharedController;

+(CCScene*)scene;

#pragma mark -
#pragma mark Game Handling

-(void)showMenu;

-(void)saveGame;

-(void)loadGame;

-(void)newGame;

#pragma mark -

@end
