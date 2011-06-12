//
//  KBTMXTiledMap.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 15.05.11.
//  Copyright 2011 KBDevers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "KBConfigurationManager.h"

@interface KBTMXTiledMap : CCTMXTiledMap {
    
    CCTMXLayer* _background;
    
    CCTMXLayer* _meta;
    
    CCTMXLayer* _items;
    
    CCTMXObjectGroup* _events;
    
}

#pragma mark -
#pragma mark Properties

@property(nonatomic, retain) CCTMXLayer* background;

@property(nonatomic, retain) CCTMXLayer* meta;

@property(nonatomic, retain) CCTMXLayer* items;

@property(nonatomic, retain) CCTMXObjectGroup* events;

#pragma mark -
#pragma mark Init & Dealloc

- (id) initWithTMXFile:(NSString *) tmxFile;

#pragma mark -
#pragma mark Convenience Methos

- (CGPoint) coordinatesAtPosition:(CGPoint) point;

- (unsigned int) getGIDAtPosition:(CGPoint) point layer:(CCTMXLayer *)layer;

- (CGPoint) tileCoordForPosition:(CGPoint) position;

- (NSDictionary *) metaInformationAtPosition:(CGPoint) position;

- (NSDictionary *) objectAtPosition:(CGPoint) position;

#pragma mark -

@end
