//
//  KBTouchHandler.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 27.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "KBTouchHandlerProtocol.h"
#import "GameConfig.h"

@interface KBTouchHandler : CCLayer {
    id<KBTouchHandlerProtocol> _delegate;
    CCSprite* background;
    CCSprite* buttonLeft;
    CCSprite* buttonRight;
    CCSprite* buttonUp;
    CCSprite* buttonDown;
}

@property(nonatomic,retain) id<KBTouchHandlerProtocol> delegate;

- (id) init;

- (BOOL) CGPoint:(CGPoint) point inTriangleP1:(CGPoint) p1 P2:(CGPoint) p2 P3:(CGPoint) p3;

- (void) ccTouchEnded:(UITouch *) touch withEvent:(UIEvent *) event;

- (CGFloat) GBDot:(CGPoint) v1 point2:(CGPoint) v2;

- (CGPoint) GBSub:(CGPoint) v1 point2:(CGPoint) v2;

-(Side) calculateWhereToWalkWithUITouch:(UITouch *)touch;

-(void) initializeDPad;

@end
