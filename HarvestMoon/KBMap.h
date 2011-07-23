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
#import "KBFarmland.h"

#pragma mark -
#pragma mark Interface

@interface KBMap : CCNode{
    
#pragma mark -
#pragma mark Class Variables
    
    KBTMXTiledMap* _tileMap;
    
    NSArray* _farmlands;
    
    NSString* _mapName;
    
}

#pragma mark -
#pragma mark Properties

@property (nonatomic, retain) KBTMXTiledMap* tileMap;

@property (nonatomic, retain) NSString* mapName;

@property (nonatomic, retain) NSArray* farmlands;

#pragma mark -
#pragma mark State Handling

-(id) init;

- (id) initWithMapName:(NSString *)mapName;

-(NSString*)getSaveFileName;

-(void)save;

-(void)load;

#pragma mark -
#pragma mark Accessibility

- (int) mapWidth;

- (int) mapHeight;

- (int) tileWidth;

- (int) tileHeight;

- (int) mapWidthInPixels;

- (int) mapHeightInPixels;

- (BOOL) centerPlayer;

#pragma mark -
#pragma mark Map Loading

-(void)loadMap;
-(void)loadNewFarmlands:(NSArray*)farmlands;
-(void)createNewFarmland;

#pragma mark -
#pragma mark Event Handling

- (NSDictionary*)eventDataAtPosition:(CGPoint)position;

#pragma mark -

@end
