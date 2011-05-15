//
//  KBPlayer.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 14.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

enum side {
    Left= 1,
    Right = 2,
    Up = 3,
    Down = 4
    } Side;

/*i am just for testing purposes*/

@interface KBPlayer : CCNode {
    
    CCSprite* _sprite;
    CCAction* _walkLeftAction;
    CCAction* _walkRightAction;
    CCAction* _walkUpAction;
    CCAction* _walkDownAction;
    CCAction* _currentAction;
    CCSpriteBatchNode* _spriteBatch;
}

@property(nonatomic,retain) CCSprite* sprite;
@property(nonatomic,retain) CCSpriteBatchNode* spriteBatchNode;
@property(nonatomic,retain) CCAction* walkLeftAction;
@property(nonatomic,retain) CCAction* walkRightAction;
@property(nonatomic,retain) CCAction* walkUpAction;
@property(nonatomic,retain) CCAction* walkDownAction;
@property(nonatomic,retain) CCAction* currentAction;

-(void)initActions;
-(CCAction *)initWalkActionWithRow:(int)y startPosition:(int)xPos spriteCount:(int)count side:(int)side;

-(void)walkToSide:(int)side;

@end
