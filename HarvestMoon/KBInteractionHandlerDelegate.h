//
//  KBTouchHandlerProtocol.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 27.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameConfig.h"

@protocol KBInteractionHandlerDelegate <NSObject>



@required
-(void)touchedAtScreenCoordinate:(CGPoint)screenCoordinate;

@optional
-(void)shouldBeginMovingPlayerToSide:(Side)side;
-(void)shouldChangePlayerMovementToSide:(Side)side;
-(void)shouldStopPlayerMovement;

@end
