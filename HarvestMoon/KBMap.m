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
#define kMapNameKey @"mapName"

@implementation KBMap

#pragma mark -
#pragma mark Properties

@synthesize tileMap = _tileMap;
@synthesize mapName = _mapName;
@synthesize farmlands = _farmlands;

- (void)setFarmlands:(NSArray *)farmlands
{
    if (self.farmlands == farmlands)
    {
        return;
    }
    NSArray *oldValue = self.farmlands;
    _farmlands = [farmlands retain];
    [oldValue release];
}

#pragma mark -
#pragma mark Init & Dealloc

- (id) initWithMapName:(NSString *)mapName {
    NSLog(@"initWithMapName");
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
                
            }
            
            self.farmlands = arr;
            
            
        }
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(load) name:kLoadGameNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(save) name:kSaveGameNotification object:nil];
        
        
    }
    return self;
}

-(NSString*)getSaveFileName
{
    return [[self.mapName stringByDeletingPathExtension] stringByAppendingPathExtension:@"plist"];
}

-(void)updateFarmland:(NSArray*)newFarmlands
{
    for (CCNode* node in self.farmlands) {
        [self removeChild:node cleanup:YES];
    }
    
    self.farmlands = newFarmlands;
    
    for (CCNode* node in newFarmlands) {
        [self addChild:node];
    }
}

-(void)load
{
    NSLog(@"load KBMap from persistent data");
    
    NSArray* retVal =(NSArray*)[[KBConfigurationManager sharedManager] loadValueFromFile:self.getSaveFileName]; 
    
    if (retVal) {
        [self updateFarmland:retVal];
    }
    
    [self initWithMapName:[[[KBConfigurationManager sharedManager] configuration] valueForKey:kCurrentMapName]];
    
    
}

-(void)save
{
    // Die Maps speichern ihre Information in eigene Files
    // Nur so kann garantiert werden, dass die Maps immer ihre eigenen Daten
    // zuverlässig wieder finden kann.
    NSLog(@"save KBMap to persistent data");
    [[KBConfigurationManager sharedManager] saveValue:self.farmlands intoFile:self.getSaveFileName];
    
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
