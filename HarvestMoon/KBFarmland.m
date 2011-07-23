//
//  KBFarmland.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 26.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBFarmland.h"
#import "KBConfigurationManager.h"

#define kXPosKey            @"xPos"
#define kYPosKey            @"yPos"
#define kHeightKey          @"height"
#define kWidthKey           @"width"
#define kTileSizeKey        @"tileSize"
#define kFarmingFieldsKey   @"farmingFields"


// definiert, wie viele Tiles lang / breit ein einzelnes Feld des gesamten Farmgebiet ist.
#define kTilesPerField 2

@implementation KBFarmland

@synthesize xPos = _xPos;
@synthesize yPos = _yPos;
@synthesize height = _height;
@synthesize width = _width;
@synthesize tileSize = _tileSize;
@synthesize farmingFields = _farmingFields;

- (id)initWithDictionary:(NSDictionary *)dict andTileSize:(CGSize)size
{
    self = [super init];
    if (self) {
        // Initialization code here.
        
        self.xPos = [[dict valueForKey:@"x"] integerValue];
        self.yPos = [[dict valueForKey:@"y"] integerValue];
        self.height = [[dict valueForKey:@"height"] integerValue];
        self.width = [[dict valueForKey:@"width"] integerValue];
        self.tileSize = size;
        
        
        self.position = ccp(self.xPos,self.yPos);
        
        NSMutableArray* arr = [NSMutableArray array];
        
        //i = width of the current farmingField
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
    self=[super init];
    if (self) {
        self.xPos = [[dataRepresentation objectForKey:kXPosKey] integerValue];
        self.yPos = [[dataRepresentation objectForKey:kYPosKey] integerValue];
        self.position = ccp(self.xPos,self.yPos);
        
        self.width = [[dataRepresentation objectForKey:kWidthKey] integerValue];
        self.height = [[dataRepresentation objectForKey:kHeightKey] integerValue];
        
        self.tileSize = CGSizeFromString([dataRepresentation objectForKey:kTileSizeKey]);
        
        
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

@end
