//
//  KBTMXTiledMap.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 15.05.11.
//  Copyright 2011 KBDevers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameConfig.h"

@interface KBTMXTiledMap : CCTMXTiledMap {
    
    CCTMXLayer* _background;
    
    CCTMXObjectGroup* _objects;
    
    CCTMXLayer* _meta;
    
    CCTMXLayer* _items;
    
}

#pragma mark -
#pragma mark Properties

@property(nonatomic, retain) CCTMXLayer* background;

@property(nonatomic, retain) CCTMXObjectGroup* objects;

@property(nonatomic, retain) CCTMXLayer* meta;

@property(nonatomic, retain) CCTMXLayer* items;

#pragma mark -
#pragma mark Init & Dealloc

- (id) initWithTMXFile:(NSString *) tmxFile;

#pragma mark -
#pragma mark Convenience Methos

- (CGPoint) coordinatesAtPosition:(CGPoint) point;

- (unsigned int) getGIDAtPosition:(CGPoint) point layer:(CCTMXLayer *)layer;

- (id) getObject:(NSString *) objectName;

- (CGPoint) tileCoordForPosition:(CGPoint) position;

- (NSDictionary *) metaInformationAtPosition:(CGPoint) position;

#pragma mark -

@end
