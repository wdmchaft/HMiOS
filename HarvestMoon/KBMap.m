//
//  KBMap.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 22.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBMap.h"
#import "KBConfigurationManager.h"

#define kFarmlandsKey @"farmlands"

@implementation KBMap

#pragma mark -
#pragma mark Properties

@synthesize tileMap = _tileMap;
@synthesize mapName = _mapName;
@synthesize farmlands = _farmlands;

#pragma mark -
#pragma mark Init & Dealloc

- (id) initWithMapName:(NSString *)mapName {
    self = [super init];
    if (self) {
        if (!(mapName == nil)) {
            self.tileMap = [KBTMXTiledMap tiledMapWithTMXFile:mapName];
            
            self.mapName = mapName;
            
            [self addChild:self.tileMap];
            
            NSMutableArray* arr = [NSMutableArray array];
            
            NSLog(@"searching for farmlands");
            
            for (NSDictionary* dict in self.tileMap.farmland.objects) {
                KBFarmland* fl = [[[KBFarmland alloc] initWithDictionary:dict andTileSize:self.tileMap.tileSize] autorelease];
                
                [arr addObject:fl];
                
                fl.position = ccp([fl xPos],[fl yPos]);
                
                [self addChild:fl];
                
                NSLog(@"created farmland %@",fl);
            }
            
            self.farmlands = arr;
            
            
        }
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(load) name:kLoadGameNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(save) name:kSaveGameNotification object:nil];
        
        
    }
    return self;
}

-(void)load
{
    [self initWithMapName:[[[KBConfigurationManager sharedManager] configuration] valueForKey:kCurrentMapName]];
    
    
    //[self loadFarmlands:[[KBConfigurationManager sharedManager].configuration valueForKey:kFarmlandsKey]];
}

-(void)save
{
    // Die Maps speichern ihre Information in eigene Files
    // Nur so kann garantiert werden, dass die Maps immer ihre eigenen Daten
    // zuverlässig wieder finden kann.
    
    
    //[[NSFileManager defaultManager] ]
    
    //NSDocumentDirectory 
    
    [[[KBConfigurationManager sharedManager] configuration] setValue:self.mapName forKey:kCurrentMapName];
    [[[KBConfigurationManager sharedManager] configuration] setValue:self.farmlands forKey:kFarmlandsKey];
}


-(id)init
{
    self = [self initWithMapName:@"Jacks_House.tmx"];
    
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

- (NSDictionary*)eventDataAtPosition:(CGPoint)position
{
    return [self.tileMap objectAtPosition:position inLayer:kEventsLayer];
}

@end
