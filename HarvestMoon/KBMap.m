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

#pragma mark -
#pragma mark Init & Dealloc

- (id) initWithMapName:(NSString *)mapName {
    self = [self init];
    
    NSLog(@"init new map: %@", mapName);
    
    if (self) {
        self.mapName = mapName;
        
        [self loadMap];
        [self createNewFarmland];
    }
    return self;
}

- (void)loadMap
{
    [self removeChild:self.tileMap cleanup:YES];
    self.tileMap = [KBTMXTiledMap tiledMapWithTMXFile:self.mapName];
    [self addChild:self.tileMap];
}

-(void)loadNewFarmlands:(NSArray*)farmlands
{
    for (KBFarmland* fl in self.farmlands) {
        [self removeChild:fl cleanup:YES];
    }
    
    self.farmlands = farmlands;
    
    for (KBFarmland* fl in self.farmlands) {
        [self addChild:fl];
    }
}

-(void)createNewFarmland
{
    NSLog(@"create a new Framland");
    
    
    for (KBFarmland* fl in self.farmlands) {
        [self removeChild:fl cleanup:YES];
    }
    
    NSMutableArray* arr = [NSMutableArray array];
    
    
    for (NSDictionary* dict in self.tileMap.farmland.objects) {
        KBFarmland* fl = [[[KBFarmland alloc] initWithDictionary:dict andTileSize:self.tileMap.tileSize] autorelease];
        
        [arr addObject:fl];
                
        [self addChild:fl];
        
    }
    
    self.farmlands = arr;
}


-(NSString*)getSaveFileName
{
    return [[self.mapName stringByDeletingPathExtension] stringByAppendingPathExtension:@"plist"];
}

-(void)load
{
    
    NSString* filePath = [[KBConfigurationManager sharedManager] documentsPathForFile:[self getSaveFileName]];

    if(![[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        NSLog(@"first visit fo map %@, can't load anything from persistent space", self.mapName);
        return;
    }


    NSLog(@"loading %@ from persistent space",self.mapName);
    NSArray* dataRepresentation = [NSArray arrayWithContentsOfFile:filePath];
    NSMutableArray* loadedFarmlands = [NSMutableArray array];
    
    
    for (NSDictionary* obj in dataRepresentation) {
        
        KBFarmland* fl = [[KBFarmland alloc]initWithDataRepresentation:obj];
        
        [loadedFarmlands addObject:fl];
        
    }
    
    [self loadNewFarmlands:loadedFarmlands];
    
    //self.farmlands = loadedFarmlands;
    
    //[self createNewFarmland];
    
    //NSArray* farmlands = [NSArray arrayWithContentsOfFile:[[KBConfigurationManager sharedManager] documentsPathForFile:[self getSaveFileName]]];
    
    //[self loadNewFarmlands:farmlands];
    
    /*
    
    //NSArray* farmlands = (NSArray*)[[KBConfigurationManager sharedManager] loadValueFromFile:self.getSaveFileName];
    
    NSString* filePath = [[KBConfigurationManager sharedManager] documentsPathForFile:[self getSaveFileName]];
    
    NSArray* farmlands = [NSArray arrayWithContentsOfFile:filePath];
    
    if (farmlands == nil) {
        NSLog(@"couldn't load farmlands");
        return;
    }
    [self loadNewFarmlands:farmlands];
    
    
    */
    /*
    
    [self initWithMapName:[[[KBConfigurationManager sharedManager] configuration] valueForKey:kCurrentMapName]];


    
    [self loadFarmland];
    
    NSLog(@"loaded %@ from persistent data", self.mapName);
     */
}

-(void)save
{
    // Die Maps speichern ihre Information in eigene Files
    // Nur so kann garantiert werden, dass die Maps immer ihre eigenen Daten
    // zuverlässig wieder finden kann.
    NSLog(@"save KBMap to persistent data");
    //[[KBConfigurationManager sharedManager] saveValue:self.farmlands intoFile:self.getSaveFileName];
    
    
    NSString* filePath = [[KBConfigurationManager sharedManager] documentsPathForFile:[self getSaveFileName]];
    
    
    NSMutableArray* dataRepresentation = [NSMutableArray array];
    
    for (KBFarmland* fl in self.farmlands) {
        [dataRepresentation addObject:[fl dataRepresentation]];
    }
    
    
    
    if(![dataRepresentation writeToFile:filePath atomically:YES])
        NSLog(@"couldn't save farmlands to file: %@", filePath);
    
}


-(id)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(load) name:kLoadGameNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(save) name:kSaveGameNotification object:nil];
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

- (NSDictionary*)eventDataAtPosition:(CGPoint)position
{
    return [self.tileMap objectAtPosition:position inLayer:kEventsLayer];
}

@end
