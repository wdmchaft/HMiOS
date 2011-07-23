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

#pragma mark -
#pragma mark Interface

@interface KBInteractionHandler : CCLayer {
    
#pragma mark -
#pragma mark Class Variables
    
    id<KBInteractionHandlerDelegate> _delegate;
    
    CCSprite* background;
    
    CCSprite* buttonLeft;
    
    CCSprite* buttonRight;
    
    CCSprite* buttonUp;
    
    CCSprite* buttonDown;
    
}

#pragma mark -
#pragma mark Properties

@property(nonatomic,retain) id<KBInteractionHandlerDelegate> delegate;

#pragma mark -
#pragma mark State Handling

- (id) init;

#pragma mark -
#pragma mark Touch Handling

- (void) ccTouchEnded:(UITouch *) touch withEvent:(UIEvent *) event;

#pragma mark -
#pragma mark Helper Methods

- (BOOL) CGPoint:(CGPoint) point inTriangleP1:(CGPoint) p1 P2:(CGPoint) p2 P3:(CGPoint) p3;

- (CGFloat) GBDot:(CGPoint) v1 point2:(CGPoint) v2;

- (CGPoint) GBSub:(CGPoint) v1 point2:(CGPoint) v2;

-(Side) calculateWhereToWalkWithUITouch:(UITouch *)touch;

#pragma mark -
#pragma mark D-Pad Handling

-(void) initializeDPad;

-(BOOL) hasDPadGotTouched:(UITouch *)touch;

#pragma mark -

@end
