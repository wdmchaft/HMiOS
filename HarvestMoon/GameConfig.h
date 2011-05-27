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
#pragma mark Generam Enums

typedef enum {
    Left= 1,
    Right = 2,
    Up = 3,
    Down = 4
} Side;


#pragma mark -
#pragma mark General Game Constants

#define kApplicationWillTerminateNotification @"AppWillTerminate"

#define kDevelopmentMode 0

#define kUseDPad 1

#pragma mark -
#pragma mark Tilemap Constants

//
// TileMap Map Names
//

#define kJacksHouseMap @"Jacks_House.tmx"
#define kCentering_Test @"centering_test.tmx"

//
// TileMap Layer Names
//

#define kBackgroundLayer    @"Background"

#define kSpawnPointObject   @"SpawnPoint"

#define kEventsLayer        @"Events"

#define kMetaLayer          @"Meta"

#define kItemsLayer         @"Items"

//
// Tileset Property Names
//

#define kCollidableProperty @"Collidable"
#define kScriptingId @"ScriptingId"

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

#endif // __GAME_CONFIG_H