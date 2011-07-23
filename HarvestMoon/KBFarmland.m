//
//  KBFarmland.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 26.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBFarmland.h"
#import "KBConfigurationManager.h"

#pragma mark -
#pragma mark ConfigurationKeys


#define kXPosKey            @"xPos"
#define kYPosKey            @"yPos"
#define kHeightKey          @"height"
#define kWidthKey           @"width"
#define kTileSizeKey        @"tileSize"
#define kFarmingFieldsKey   @"farmingFields"

#pragma mark -
#pragma mark Constants

// definiert, wie viele Tiles lang / breit ein einzelnes Feld des gesamten Farmgebiet ist.
#define kTilesPerField 2

#pragma mark -
#pragma mark Implementation

@implementation KBFarmland

#pragma mark -
#pragma mark Properties

@synthesize xPos = _xPos;

@synthesize yPos = _yPos;

@synthesize height = _height;

@synthesize width = _width;

@synthesize tileSize = _tileSize;

@synthesize farmingFields = _farmingFields;

#pragma mark -
#pragma mark State Handling

-(id)initwithXPos:(int)x yPos:(int)y height:(int)height 
            width:(int)width tileSize:(CGSize)tileSize
{
    self = [super init];
    if (self) {
        self.xPos = x;
        self.yPos = y;
        self.height = height;
        self.width = width;
        self.position = ccp(x,y);
        self.tileSize = tileSize;
    }
    
    return self;
}

- (id)initWithDictionary:(NSDictionary *)dict andTileSize:(CGSize)size
{
    self = [self initwithXPos:[[dict valueForKey:@"x"] integerValue] 
                         yPos:[[dict valueForKey:@"y"] integerValue] 
                       height:[[dict valueForKey:@"height"] integerValue] 
                        width:[[dict valueForKey:@"width"] integerValue] 
                     tileSize:size];
    
    if(self)
    {
        NSMutableArray* arr = [NSMutableArray array];
        
        for (int i = 0; i <= self.width ; i+=kTilesPerField*self.tileSize.width) {
            for (int j = 0; j <= self.height; j+=kTilesPerField*self.tileSize.height) {
                KBFarmingField* field = [[KBFarmingField alloc] init];
                
                field.position = ccp(i,j);
                
                [arr addObject:field];
                
                [self addChild:field];
            
                [field release];
            }
        }
    
        self.farmingFields = arr;    
    }
    return self;
}

-(id)initWithDataRepresentation:(NSDictionary *)dataRepresentation
{
    self = [self initwithXPos:[[dataRepresentation objectForKey:kXPosKey] integerValue]
                         yPos:[[dataRepresentation objectForKey:kYPosKey] integerValue]
                       height:[[dataRepresentation objectForKey:kHeightKey] integerValue] 
                        width:[[dataRepresentation objectForKey:kWidthKey] integerValue]
                     tileSize:CGSizeFromString([dataRepresentation objectForKey:kTileSizeKey])];
    
    if (self) {
        NSMutableArray* fields = [dataRepresentation objectForKey:kFarmingFieldsKey];
        NSMutableArray* farmingFields = [NSMutableArray array];
        
        for (NSDictionary* dict in fields) {
            
            KBFarmingField* fl = [[KBFarmingField alloc] initWithDataRepresentation:dict];
            
            [farmingFields addObject:fl];
            
            [self addChild:fl];
        }
        
        self.farmingFields = farmingFields;
    }
    
    return self;
}

-(NSDictionary *)dataRepresentation
{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    
    
    [dict setObject:[NSNumber numberWithInt:self.xPos] forKey:kXPosKey];
    [dict setObject:[NSNumber numberWithInt:self.yPos] forKey:kYPosKey];
    [dict setObject:[NSNumber numberWithInt:self.width] forKey:kWidthKey];
    [dict setObject:[NSNumber numberWithInt:self.height] forKey:kHeightKey];
    [dict setObject:NSStringFromCGSize(self.tileSize) forKey:kTileSizeKey];
    
    NSMutableArray* fields = [NSMutableArray array];
    
    for (KBFarmingField* fl in self.farmingFields) {
        [fields addObject:[fl dataRepresentation]];
    }
    
    [dict setObject:fields forKey:kFarmingFieldsKey];
    
    return dict;
}

#pragma mark -

@end
