//
//  KBMap.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 22.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "KBTMXTiledMap.h"
#import "GameConfig.h"

@interface KBMap : CCNode {
    
    KBTMXTiledMap* _tileMap;
    
}

#pragma mark -
#pragma mark Properties

@property (nonatomic, retain) KBTMXTiledMap* tileMap;

#pragma mark -
#pragma mark Init & Dealloc

- (id) initWithMapName:(NSString *)mapName;

#pragma mark -
#pragma mark Accessibility

- (int) mapWidth;

- (int) mapHeight;

- (int) tileWidth;

- (int) tileHeight;

- (BOOL) centerPlayer;

#pragma mark -

@end
