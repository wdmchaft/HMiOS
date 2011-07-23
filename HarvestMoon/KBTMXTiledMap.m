//
//  KBTMXTiledMap.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 15.05.11.
//  Copyright 2011 KBDevers. All rights reserved.
//

#import "KBTMXTiledMap.h"

#pragma mark -
#pragma mark Implementation

@implementation KBTMXTiledMap

#pragma mark -
#pragma mark Properties

@synthesize background = _background;

@synthesize meta = _meta;

@synthesize items = _items;

@synthesize events = _events;

@synthesize farmland = _farmland;

#pragma mark -
#pragma mark State Handling

- (id) initWithTMXFile:(NSString *) tmxFile
{
    self = [super initWithTMXFile:tmxFile];
    if (self) {
        self.background = [self layerNamed:kBackgroundLayer];
        NSAssert(self.background != nil, @"Couldn't find Background Layer in this TMX File.");
        
        self.events = [self objectGroupNamed:kEventsLayer];
        
        self.meta = [self layerNamed:kMetaLayer];
        self.items = [self layerNamed:kItemsLayer];
        self.farmland = [self objectGroupNamed:kFarmlandLayer];
        
        if([[KBConfigurationManager sharedManager] intForKey:kDevelopmentMode] == NO)
            [self.meta setVisible:NO];
        
    }
    
    return self;
}

#pragma mark -
#pragma mark Convenience Methods

- (CGPoint) coordinatesAtPosition:(CGPoint) point 
{
    return ccp((int)(point.x / self.tileSize.width), (int)(self.mapSize.height -(point.y / self.tileSize.height)));
}

-(unsigned int) getGIDAtPosition:(CGPoint) point  layer:(CCTMXLayer *)layer
{
    return[self.background tileGIDAt:[self coordinatesAtPosition:point]];
}

- (CGPoint) tileCoordForPosition:(CGPoint) position 
{
    int x = position.x / self.tileSize.width;
    int y = ((self.mapSize.height * self.tileSize.height) - position.y) / self.tileSize.height;
    return ccp(x, y);
}

- (NSDictionary *) metaInformationAtPosition:(CGPoint) position
{
    unsigned int GID = [self.meta tileGIDAt:position];
    unsigned int GID2 = [self.items tileGIDAt:position];
    unsigned int GID3 = [self.background tileGIDAt:position];
    
    NSMutableDictionary* dict = [NSMutableDictionary dictionaryWithDictionary:[self propertiesForGID:GID]];
    
    [dict addEntriesFromDictionary:[self propertiesForGID:GID2]];
    [dict addEntriesFromDictionary:[self propertiesForGID:GID3]];
    
    return dict;
}

- (NSDictionary *) objectAtPosition:(CGPoint) position inLayer:(NSString*)layerName
{
    
    for (NSMutableDictionary* object in [[self objectGroupNamed:layerName] objects]) {
        
        int x = [[object valueForKey:@"x"] integerValue];
        int y = [[object valueForKey:@"y"] integerValue];
        int h = [[object valueForKey:@"height"] integerValue];
        int w = [[object valueForKey:@"width"] integerValue];
        
        CGPoint min = ccp(x,y);
        CGPoint max = ccp(x + w, y + h);
        
        
        if(position.x > min.x && position.y > min.y && position.x < max.x && position.y < max.y)
            return object;
    }
    
    return nil;
}

#pragma mark -

@end
