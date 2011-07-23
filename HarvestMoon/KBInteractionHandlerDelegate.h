//
//  KBTouchHandlerProtocol.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 27.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameConfig.h"

#pragma mark -
#pragma mark Protocol

@protocol KBInteractionHandlerDelegate <NSObject>

#pragma mark -
#pragma mark Required Methods

@required

-(void)touchedAtScreenCoordinate:(CGPoint)screenCoordinate;

#pragma mark -
#pragma mark Optional Methods

@optional

-(void)shouldBeginMovingPlayerToSide:(Side)side;

-(void)shouldChangePlayerMovementToSide:(Side)side;

-(void)shouldStopPlayerMovement;

#pragma mark -

@end
