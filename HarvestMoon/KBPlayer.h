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

typedef enum {
    Left= 1,
    Right = 2,
    Up = 3,
    Down = 4
    } Side;

/*i am just for testing purposes*/

@interface KBPlayer : CCNode {
    
    CCSprite* _sprite;
    CCSpriteBatchNode* _spriteBatch;
    
    // Walking Variables
    int _walkingSpeed;
    CCAction* _currentAnimation;
    BOOL _walking;
    Side _walkingTo;
}

@property(nonatomic,retain) CCSprite* sprite;
@property(nonatomic,retain) CCSpriteBatchNode* spriteBatchNode;
@property(nonatomic,retain) CCAction* currentAnimation;
@property(nonatomic) BOOL isWalking;
@property(nonatomic) Side walkingTo;


-(void)update:(ccTime)dt;
-(void)beginWalkingToSide:(Side)side;
-(void)stopWalking;
-(CCAction *)walkAnimationWithRow:(int)y startPosition:(int)xPos spriteCount:(int)count side:(int)side;

- (void) handleWalking;
@end
