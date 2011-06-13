//
//  KBG8ameMenuLayer.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 13.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface KBGameMenuLayer : CCLayer
{
    CCSprite* _itemBackground;
    CCSprite* _toolBackground;
}

@property(nonatomic,retain) CCSprite* itemBackground;
@property(nonatomic,retain) CCSprite* toolBackground;

@end
