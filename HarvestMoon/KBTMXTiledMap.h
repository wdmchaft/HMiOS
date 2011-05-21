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
    CCTMXLayer* _background;
    CCTMXObjectGroup* _objects;
    CCTMXLayer* _meta;
}

@property(nonatomic,retain) CCTMXLayer* background;
@property(nonatomic,retain) CCTMXObjectGroup* objects;
@property(nonatomic,retain) CCTMXLayer* meta;

-(CGPoint)coordinatesAtPosition:(CGPoint)point;
-(unsigned int)getGIDAtPosition:(CGPoint)point;
-(id)getObject:(NSString *)objectName;
- (CGPoint)tileCoordForPosition:(CGPoint)position;


-(NSDictionary*)metaInformationAtPosition:(CGPoint)position;
@end
