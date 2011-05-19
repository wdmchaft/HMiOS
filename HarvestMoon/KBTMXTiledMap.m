//
//  KBTMXTiledMap.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 15.05.11.
//  Copyright 2011 KBDevers. All rights reserved.
//

#import "KBTMXTiledMap.h"
#import "GameConfig.h"

@implementation KBTMXTiledMap
@synthesize background=_background,objects=_objects;

-(id)initWithTMXFile:(NSString *)tmxFile
{
    self = [super initWithTMXFile:tmxFile];
    if (self) {
        self.background = [self layerNamed:kBackgroundLayer];
        NSAssert(self.background != nil, @"Couldn't find Background Layer in this TMX File.", tmxFile);
        self.objects = [self objectGroupNamed:kObjectLayer];
        
    }
    
    return self;
}

-(CGPoint)coordinatesAtPosition:(CGPoint)point {
    return ccp((int)(point.x / self.tileSize.width), (int)(self.mapSize.height -(point.y / self.tileSize.height)));
}

-(unsigned int)getGIDAtPosition:(CGPoint)point {
    
    return[self.background tileGIDAt:[self coordinatesAtPosition:point]];
}


-(id)getObject:(NSString *)objectName
{
    NSAssert(self.objects != nil,@"There is no Object Layer!",nil);
    
        
    return [self.objects objectNamed:objectName];
}

@end
