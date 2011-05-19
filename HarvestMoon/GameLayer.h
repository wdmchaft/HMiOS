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
#import "KBTMXTiledMap.h"

// HelloWorldLayer
@interface GameLayer : CCLayer
{
    KBPlayer* _player;
    KBTMXTiledMap* _map;
    
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;


@property(nonatomic,retain) KBTMXTiledMap* map;
@property(nonatomic,retain) KBPlayer* player;


-(BOOL) CGPoint:(CGPoint)point inTriangleP1:(CGPoint)p1 P2:(CGPoint)p2 P3:(CGPoint)p3;
-(void)setViewpointCenter:(CGPoint)position;

@end
