//
//  KBFarmland.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 26.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "KBFarmingField.h"

#define kMagnification 2

@interface KBFarmland : CCNode{
    int _xPos;
    int _yPos;
    int _height;
    int _width;
    CGSize _tileSize;
    NSArray* _farmingFields;
}

@property(nonatomic) int xPos;
@property(nonatomic) int yPos;
@property(nonatomic) int height;
@property(nonatomic) int width;
@property(nonatomic) CGSize tileSize;
@property(nonatomic,retain) NSArray* farmingFields;

- (id)initWithDictionary:(NSDictionary *)dict andTileSize:(CGSize)size;
-(id)initWithDataRepresentation:(NSDictionary*)dataRepresentation;
-(NSDictionary*)dataRepresentation;

@end
