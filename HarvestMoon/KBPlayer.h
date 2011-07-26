//
//  KBPlayer.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 14.05.11.
//  Copyright 2011 KBDevers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "KBStandardGameController.h"
#import "GameConfig.h"
#import "KBInventory.h"

#pragma mark -
#pragma mark Interface

@interface KBPlayer : CCNode {
    
#pragma mark -
#pragma mark Class Variables
    
    CCSprite* _sprite;
    
    CCSpriteBatchNode* _spriteBatch;
    
    BOOL _centerPlayer;
    
    // Walking Variables
    
    int _walkingSpeed;
    
    CCAction* _currentAnimation;
    
    BOOL _walking;
    
    Side _walkingTo;
    
    // Animations
    
    CCAction* _walkLeftAnimation;
    
    CCAction* _walkRightAnimation;
    
    CCAction* _walkUpAnimation;
    
    CCAction* _walkDownAnimation;
    
    CCAction* _stayLeftAnimation;
    
    CCAction* _stayRightAnimation;
    
    CCAction* _stayUpAnimation;
    
    CCAction* _stayDownAnimation;
    
    KBInventory* _inventory;
    
}

#pragma mark -
#pragma mark Properties

@property (nonatomic, retain) CCSprite* sprite;

@property (nonatomic, retain) CCSpriteBatchNode* spriteBatchNode;

@property (nonatomic, retain) CCAction* currentAnimation;

@property (nonatomic) BOOL isWalking;

@property (nonatomic) Side walkingTo;

@property (nonatomic, retain) KBInventory* inventory;

#pragma mark -
#pragma mark State Handling

- (id) init;

-(void)load;

-(void)save;

#pragma mark -
#pragma mark CCNode Methods

- (void) update:(ccTime) dt;

#pragma mark -
#pragma mark MapChange Methods

- (void) updatePlayerForMapChange;

#pragma mark -
#pragma mark Walking

- (void) beginWalkingToSide:(Side) side;

- (void) stopWalking;

- (CCAction *) walkAnimationWithRow:(int) y startPosition:(int) xPos spriteCount:(int) count side:(int) side;

- (void) handleWalking;

#pragma mark -
#pragma mark Item Using

-(void)useItem:(KBItemStack*)itemStack;

-(void)showAnimationForItemType:(KBItem*)itemType;

@end
