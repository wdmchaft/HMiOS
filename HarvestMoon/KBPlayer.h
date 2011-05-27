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

@interface KBPlayer : CCNode {
    
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
    
}

#pragma mark -
#pragma mark Properties

@property (nonatomic, retain) CCSprite* sprite;

@property (nonatomic, retain) CCSpriteBatchNode* spriteBatchNode;

@property (nonatomic, retain) CCAction* currentAnimation;

@property (nonatomic) BOOL isWalking;

@property (nonatomic) Side walkingTo;

#pragma mark -
#pragma mark Init & Dealloc

- (id) init;

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

@end
