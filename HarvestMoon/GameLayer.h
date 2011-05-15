//
//  HelloWorldLayer.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 14.05.11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "KBPlayer.h"

// HelloWorldLayer
@interface GameLayer : CCLayer
{
    KBPlayer* _player;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;


-(BOOL) CGPoint:(CGPoint)point inTriangleP1:(CGPoint)p1 P2:(CGPoint)p2 P3:(CGPoint)p3;


@end
