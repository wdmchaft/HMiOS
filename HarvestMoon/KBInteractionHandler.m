//
//  KBTouchHandler.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 27.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBInteractionHandler.h"
#import "KBStandardGameController.h"

#pragma mark -
#pragma mark Implementation

@implementation KBInteractionHandler

#pragma mark -
#pragma mark Properties

@synthesize delegate=_delegate;

#pragma mark -
#pragma mark State Handling

- (id)init {
    self = [super init];
    if (self) {
        self.isTouchEnabled = YES;
        
        if ([((NSNumber*)[[KBConfigurationManager sharedManager].configuration objectForKey:kUseDPad]) integerValue]) {
            [self initializeDPad];
        }
    }
    return self;
}

#pragma mark -
#pragma mark Touch Handling

- (void) registerWithTouchDispatcher
{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

- (BOOL) ccTouchBegan:(UITouch *) touch withEvent:(UIEvent *) event
{
    
    if ([((NSNumber*)[[KBConfigurationManager sharedManager].configuration objectForKey:kUseDPad]) integerValue]) {
        if ([self hasDPadGotTouched:touch]) 
        {
            [self.delegate shouldBeginMovingPlayerToSide:[self calculateWhereToWalkWithUITouch:touch]];
        }
        else if(!CGRectContainsPoint(background.textureRect, [background convertTouchToNodeSpace:touch]))
        {
            [self.delegate touchedAtScreenCoordinate:[touch locationInView:[touch view]]];
        }
    }
    else
    {
        [self.delegate shouldBeginMovingPlayerToSide:[self calculateWhereToWalkWithUITouch:touch]]; 
    }
    
    
    
    return YES;
}

- (void) ccTouchMoved:(UITouch *) touch withEvent:(UIEvent *) event
{
    if ([((NSNumber*)[[KBConfigurationManager sharedManager].configuration objectForKey:kUseDPad]) integerValue]) {
        if ([self hasDPadGotTouched:touch]) 
        {
            [self.delegate shouldBeginMovingPlayerToSide:[self calculateWhereToWalkWithUITouch:touch]];
        }
        else if(!CGRectContainsPoint(background.textureRect, [background convertTouchToNodeSpace:touch]))
        {
            CGPoint touchLocation = [touch locationInView:[touch view]];
            
            touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
            
            [self.delegate touchedAtScreenCoordinate:touchLocation];
        }
    }
    else
    {
        [self.delegate shouldBeginMovingPlayerToSide:[self calculateWhereToWalkWithUITouch:touch]]; 
    }
}

- (void) ccTouchEnded:(UITouch *) touch withEvent:(UIEvent *) event
{
    if ([((NSNumber*)[[KBConfigurationManager sharedManager].configuration objectForKey:kUseDPad]) integerValue]) {
        if ([self hasDPadGotTouched:touch]) 
        {
            [self.delegate shouldStopPlayerMovement];
        }
    }
    else
    {
        [self.delegate shouldStopPlayerMovement];
        [self.delegate touchedAtScreenCoordinate:[touch locationInView:[touch view]]];
    }
    
}

#pragma mark -
#pragma mark Helper Methods

-(Side) calculateWhereToWalkWithUITouch:(UITouch *)touch
{
    if ([((NSNumber*)[[KBConfigurationManager sharedManager].configuration objectForKey:kUseDPad]) integerValue]) {
        if(CGRectContainsPoint(buttonLeft.textureRect, [buttonLeft convertTouchToNodeSpace:touch]))
            return Left;
        if(CGRectContainsPoint(buttonRight.textureRect, [buttonRight convertTouchToNodeSpace:touch]))
            return Right;
        if(CGRectContainsPoint(buttonDown.textureRect, [buttonDown convertTouchToNodeSpace:touch]))
            return Up;
        if(CGRectContainsPoint(buttonUp.textureRect, [buttonUp convertTouchToNodeSpace:touch]))
            return Down;
        
    }
    else
    {
        CGPoint touchLocation = [touch locationInView:[touch view]];
        
        touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
        //touchLocation = [self convertToNodeSpace:touchLocation];
        
        int width =[[CCDirector sharedDirector] winSize].width;
        int height =[[CCDirector sharedDirector] winSize].height;
        
        CGPoint middlePoint = CGPointMake(width/2, height/2);
        CGPoint lo = CGPointMake(0, 0);
        CGPoint lu = CGPointMake(0, height);
        CGPoint ro = CGPointMake(width, 0);
        CGPoint ru = CGPointMake(width, height);
        
        
        if ([self CGPoint:touchLocation inTriangleP1:lu P2:lo P3:middlePoint]) {
            return Left;
        }
        if ([self CGPoint:touchLocation inTriangleP1:ru P2:ro P3:middlePoint]) {
            return Right;
        }
        if ([self CGPoint:touchLocation inTriangleP1:lo P2:ro P3:middlePoint]) {
            return Up;
        }
        if ([self CGPoint:touchLocation inTriangleP1:lu P2:ru P3:middlePoint]) {
            return Down;
        }
        
        return Down;
    }
    
    //didn't touch the dpad or made a touch outside of the sceen
    return -1;
}

- (CGFloat) GBDot:(CGPoint) v1 point2:(CGPoint) v2
{
    return v1.x * v2.x + v1.y * v2.y;
}

- (CGPoint) GBSub:(CGPoint) v1 point2:(CGPoint) v2
{
    return CGPointMake(v1.x - v2.x, v1.y - v2.y);
}

- (BOOL) CGPoint:(CGPoint) point inTriangleP1:(CGPoint) p1 P2:(CGPoint) p2 P3:(CGPoint) p3
{
    CGPoint v0 = [self GBSub:p3 point2:p1];
    CGPoint v1 = [self GBSub:p2 point2:p1];
    CGPoint v2 = [self GBSub:point point2:p1];
    
    CGFloat dot00 = [self GBDot:v0 point2:v0];
    CGFloat dot01 = [self GBDot:v0 point2:v1];
    CGFloat dot02 = [self GBDot:v0 point2:v2];
    CGFloat dot11 = [self GBDot:v1 point2:v1];
    CGFloat dot12 = [self GBDot:v1 point2:v2];
    
    
    CGFloat invDenom = 1/(dot00 * dot11 - dot01 * dot01);
    CGFloat u = (dot11 * dot02 - dot01 * dot12) * invDenom;
    CGFloat v = (dot00 * dot12 - dot01 * dot02) *invDenom;
    
    return (u > 0) && (v > 0) && (u + v < 1);
}

#pragma mark -
#pragma mark D-Pad Handling

-(void) initializeDPad
{
    background = [CCSprite spriteWithFile:@"DPad_Background.png"];
    buttonLeft = [CCSprite spriteWithFile:@"DPad_Button.png"];
    buttonRight = [CCSprite spriteWithFile:@"DPad_Button.png"];
    buttonUp = [CCSprite spriteWithFile:@"DPad_Button.png"];
    buttonDown = [CCSprite spriteWithFile:@"DPad_Button.png"];
    
    buttonLeft.rotation = -90;
    buttonRight.rotation = 90;
    buttonDown.rotation = 180;
    
    
    background.position = ccp([[CCDirector sharedDirector] winSize].width - background.contentSize.width/2,background.contentSize.height/2);
    
    
    buttonUp.position = ccp(background.position.x,background.position.y + background.contentSize.height/2 - buttonUp.contentSize.height/2);
	buttonDown.position = ccp(background.position.x,background.position.y - background.contentSize.height/2 + buttonDown.contentSize.height/2);
	buttonRight.position = ccp(background.position.x + background.contentSize.width/2 - buttonRight.contentSize.width/2,background.position.y);
	buttonLeft.position = ccp(background.position.x - background.contentSize.width/2 + buttonLeft.contentSize.width/2,background.position.y);
    
    [self addChild:background];
    [self addChild:buttonDown];
    [self addChild:buttonLeft];
    [self addChild:buttonRight];
    [self addChild:buttonUp];
    
}

-(BOOL) hasDPadGotTouched:(UITouch *)touch
{
    if(CGRectContainsPoint(buttonLeft.textureRect, [buttonLeft convertTouchToNodeSpace:touch]))
        return YES;
    if(CGRectContainsPoint(buttonRight.textureRect, [buttonRight convertTouchToNodeSpace:touch]))
        return YES;
    if(CGRectContainsPoint(buttonDown.textureRect, [buttonDown convertTouchToNodeSpace:touch]))
        return YES;
    if(CGRectContainsPoint(buttonUp.textureRect, [buttonUp convertTouchToNodeSpace:touch]))
        return YES;
    
    return NO;
}

#pragma mark -

@end
