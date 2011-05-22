//
//  HelloWorldLayer.h
//  HarvestMoon
//
//  Created by Maurus KŸhne on 14.05.11.
//  Copyright KBDevers 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "KBPlayer.h"
#import "KBStandardGameController.h"
#import "KBMap.h"
#import "KBGameLayer.h"
#import "GameConfig.h"
#import "KBStoryController.h"

// HelloWorldLayer
@interface KBGameLayer : CCLayer
{
    KBPlayer* _player;
    
    KBMap* _map;
    
}

#pragma mark -
#pragma mark Properties

@property (nonatomic, retain) KBMap* map;

@property (nonatomic, retain) KBPlayer* player;

#pragma mark -
#pragma mark Class Methods

// returns a CCScene that contains the HelloWorldLayer as the only child
+ (CCScene *) scene;

#pragma mark -
#pragma mark Init & Dealloc

- (id) init;

- (void) dealloc;

#pragma mark -
#pragma mark Touch Handling

- (BOOL) CGPoint:(CGPoint) point inTriangleP1:(CGPoint) p1 P2:(CGPoint) p2 P3:(CGPoint) p3;

- (void) registerWithTouchDispatcher;

- (BOOL) ccTouchBegan:(UITouch *) touch withEvent:(UIEvent *) event;

- (void) ccTouchMoved:(UITouch *) touch withEvent:(UIEvent *) event;

- (void) ccTouchEnded:(UITouch *) touch withEvent:(UIEvent *) event;

- (CGFloat) GBDot:(CGPoint) v1 point2:(CGPoint) v2;

- (CGPoint) GBSub:(CGPoint) v1 point2:(CGPoint) v2;

#pragma mark -
#pragma mark Camera Handling

- (void) setViewpointCenter:(CGPoint) position;

#pragma mark -

@end
