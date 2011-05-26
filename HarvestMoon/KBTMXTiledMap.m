//
//  KBTMXTiledMap.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 15.05.11.
//  Copyright 2011 KBDevers. All rights reserved.
//

#import "KBTMXTiledMap.h"

@implementation KBTMXTiledMap

#pragma mark -
#pragma mark Properties

@synthesize background = _background;

@synthesize objects = _objects;

@synthesize meta = _meta;

@synthesize items = _items;

#pragma mark -
#pragma mark Init & Dealloc

- (id) initWithTMXFile:(NSString *) tmxFile
{
    self = [super initWithTMXFile:tmxFile];
    if (self) {
        self.background = [self layerNamed:kBackgroundLayer];
        NSAssert(self.background != nil, @"Couldn't find Background Layer in this TMX File.", tmxFile);
        self.objects = [self objectGroupNamed:kObjectLayer];
        self.meta = [self layerNamed:kMetaLayer];
        self.items = [self layerNamed:kItemsLayer];
        
        
        if(kDevelopmentMode == NO)
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

- (id) getObject:(NSString *) objectName
{
    NSAssert(self.objects != nil,@"There is no Object Layer!",nil);
    
        
    return [self.objects objectNamed:objectName];
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
#pragma mark -

@end
