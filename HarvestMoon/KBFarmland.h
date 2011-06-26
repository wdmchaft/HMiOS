//
//  KBFarmland.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 26.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#define kMagnification 2

@interface KBFarmland : CCNode {
    int _xPos;
    int _yPos;
    int _height;
    int _width;
    
}

@property(nonatomic) int xPos;
@property(nonatomic) int yPos;
@property(nonatomic) int height;
@property(nonatomic) int width;


@end
