//
//  KBMap.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 22.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBMap.h"


@implementation KBMap

#pragma mark -
#pragma mark Properties

@synthesize tileMap = _tileMap;
@synthesize mapName = _mapName;

#pragma mark -
#pragma mark Init & Dealloc

- (id) initWithMapName:(NSString *)mapName {
    self = [super init];
    if (self) {
        self.tileMap = [KBTMXTiledMap tiledMapWithTMXFile:mapName];
        
        self.mapName = mapName;
        
        [self addChild:self.tileMap];
    }
    return self;
}

#pragma mark -
#pragma mark Accessibility

- (int) mapWidth
{
    return self.tileMap.mapSize.width;
}

- (int) mapHeight
{
    return self.tileMap.mapSize.height;
}

- (int) tileWidth
{
    return self.tileMap.tileSize.width;
}

- (int) tileHeight
{
    return self.tileMap.tileSize.height;
}

- (int) mapWidthInPixels
{
    return self.mapWidth * self.tileWidth;
}

- (int) mapHeightInPixels
{
    return self.mapHeight * self.tileHeight;
}

- (BOOL) centerPlayer
{
    int screenWidth = [[CCDirector sharedDirector] winSize].width;
    int screenHeight = [[CCDirector sharedDirector] winSize].height;
    
    return (screenWidth < (self.mapWidth * self.tileWidth) || screenHeight < (self.mapHeight * self.tileHeight));
}

#pragma mark -

@end
