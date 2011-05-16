//
//  KBTMXTiledMap.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 15.05.11.
//  Copyright 2011 KBDevers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface KBTMXTiledMap : CCTMXTiledMap {
    CCTMXLayer* _layer;
}

@property(nonatomic,retain) CCTMXLayer* layer;


-(CGPoint)coordinatesAtPosition:(CGPoint)point;
-(unsigned int)getGIDAtPosition:(CGPoint)point;
@end
