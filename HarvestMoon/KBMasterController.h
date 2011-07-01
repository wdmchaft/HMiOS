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

@interface KBMasterController : CCNode {
    KBMainMenuLayer* _mainMenuLayer;
    KBGameLayer* _gameLayer;
    KBInteractionHandler* _interactionHandler;
    KBGameMenuLayer* _gameMenuLayer;
}

@property(nonatomic,retain) KBMainMenuLayer* mainMenuLayer;
@property(nonatomic,retain) KBGameLayer* gameLayer;
@property(nonatomic,retain) KBGameMenuLayer* gameMenuLayer;
@property(nonatomic,retain) KBInteractionHandler* interactionHandler;


+ (KBMasterController *) sharedController;

+(CCScene*)scene;

-(void)showMenu;
-(void)saveGame;
-(void)loadGame;
-(void)newGame;

@end
