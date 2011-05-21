//
//  GameConfig.h
//  HarvestMoon
//
//  Created by Maurus KŸhne on 14.05.11.
//  Copyright KBDevers 2011. All rights reserved.
//

#ifndef __GAME_CONFIG_H
#define __GAME_CONFIG_H

#pragma mark -
#pragma mark Cocos2D Constants

//
// Supported Autorotations:
//		None,
//		UIViewController,
//		CCDirector
//

#define kGameAutorotationNone 0

#define kGameAutorotationCCDirector 1

#define kGameAutorotationUIViewController 2

//
// Define here the type of autorotation that you want for your game
//

#define GAME_AUTOROTATION kGameAutorotationUIViewController

#pragma mark -
#pragma mark Tilemap Constants

//
// TileMap Layer Names
//

#define kBackgroundLayer    @"Background"

#define kSpawnPointObject   @"SpawnPoint"

#define kObjectLayer        @"Objects"

#define kMetaLayer          @"Meta"

//
// Tileset Property Names
//

#define kCollidableProperty @"Collidable"

#pragma mark -

#endif // __GAME_CONFIG_H