//
//  KBTMXTiledMap.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 15.05.11.
//  Copyright 2011 KBDevers. All rights reserved.
//

#import "KBTMXTiledMap.h"


@implementation KBTMXTiledMap
@synthesize layer=_layer;

-(id)initWithTMXFile:(NSString *)tmxFile
{
    self = [super initWithTMXFile:tmxFile];
    if (self) {
        self.layer = [self layerNamed:@"Ebene 0"];
    }
    
    return self;
}

-(CGPoint)coordinatesAtPosition:(CGPoint)point {
    return ccp((int)(point.x / self.tileSize.width), (int)(self.mapSize.height -(point.y / self.tileSize.height)));
}

-(unsigned int)getGIDAtPosition:(CGPoint)point {
    
    return[self.layer tileGIDAt:[self coordinatesAtPosition:point]];
}

@end
