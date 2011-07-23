//
//  KBFarmland.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 26.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "KBFarmingField.h"

#pragma mark -
#pragma mark Interface

@interface KBFarmland : CCNode{

    #pragma mark -
    #pragma mark Class Variables
    
    int _xPos;
    
    int _yPos;
    
    int _height;
    
    int _width;
    
    CGSize _tileSize;
    
    NSArray* _farmingFields;

}

#pragma mark -
#pragma mark Properties

@property(nonatomic) int xPos;

@property(nonatomic) int yPos;

@property(nonatomic) int height;

@property(nonatomic) int width;

@property(nonatomic) CGSize tileSize;

@property(nonatomic,retain) NSArray* farmingFields;

#pragma mark -
#pragma mark State Handling

-(id)initwithXPos:(int)x yPos:(int)y height:(int)height width:(int)width tileSize:(CGSize)tileSize;

- (id)initWithDictionary:(NSDictionary *)dict andTileSize:(CGSize)size;

-(id)initWithDataRepresentation:(NSDictionary*)dataRepresentation;

-(NSDictionary*)dataRepresentation;

#pragma mark -

@end
