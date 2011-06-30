//
//  KBTouchHandler.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 27.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "KBInteractionHandlerDelegate.h"
#import "KBInteractionHandler.h"
#import "GameConfig.h"
#import "KBConfigurationManager.h"

@interface KBInteractionHandler : CCLayer <NSCoding>{
    id<KBInteractionHandlerDelegate> _delegate;
    CCSprite* background;
    CCSprite* buttonLeft;
    CCSprite* buttonRight;
    CCSprite* buttonUp;
    CCSprite* buttonDown;
}

@property(nonatomic,retain) id<KBInteractionHandlerDelegate> delegate;

- (id) init;

- (BOOL) CGPoint:(CGPoint) point inTriangleP1:(CGPoint) p1 P2:(CGPoint) p2 P3:(CGPoint) p3;

- (void) ccTouchEnded:(UITouch *) touch withEvent:(UIEvent *) event;

- (CGFloat) GBDot:(CGPoint) v1 point2:(CGPoint) v2;

- (CGPoint) GBSub:(CGPoint) v1 point2:(CGPoint) v2;

-(Side) calculateWhereToWalkWithUITouch:(UITouch *)touch;

-(void) initializeDPad;

-(BOOL) hasDPadGotTouched:(UITouch *)touch;

@end
