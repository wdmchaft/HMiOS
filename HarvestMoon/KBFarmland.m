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

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    NSLog(@"saving farmland to persistent data");
    [aCoder encodeInt:self.xPos forKey:kXPosKey];
    [aCoder encodeInt:self.yPos forKey:kYPosKey];
    
    [aCoder encodeInt:self.width forKey:kWidthKey];
    [aCoder encodeInt:self.height forKey:kHeightKey];
    
    [aCoder encodeCGSize:self.tileSize forKey:kTileSizeKey];
    
    [aCoder encodeObject:self.farmingFields forKey:kFarmingFieldsKey];
    
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.xPos = [aDecoder decodeIntForKey:kXPosKey];
        self.yPos = [aDecoder decodeIntForKey:kYPosKey];
        
        self.width = [aDecoder decodeIntForKey:kWidthKey];
        self.height = [aDecoder decodeIntForKey:kHeightKey];
        
        self.tileSize = [aDecoder decodeCGSizeForKey:kTileSizeKey];
        
        self.farmingFields = [aDecoder decodeObjectForKey:kFarmingFieldsKey];
        
        NSLog(@"created Farmland from persistent data");
        
    }
    return self;
}
@end
