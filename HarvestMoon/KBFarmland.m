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
                
                NSLog(@"created farmingfield");
                
                field.position = ccp(i,j);
                
                [arr addObject:field];
                
                [self addChild:field];
            }
        }
        
        self.farmingFields = arr;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(load) name:kLoadGameNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(save) name:kSaveGameNotification object:nil];
        
    }
    
    return self;
}

-(void)load
{
    self.xPos = [[KBConfigurationManager sharedManager] intForKey:kXPosKey];
    self.yPos = [[KBConfigurationManager sharedManager] intForKey:kYPosKey];
    self.width = [[KBConfigurationManager sharedManager] intForKey:kWidthKey];
    self.height= [[KBConfigurationManager sharedManager] intForKey:kHeightKey];
    self.tileSize = [[KBConfigurationManager sharedManager] sizeForKey:kTileSizeKey];
    self.farmingFields = [[[KBConfigurationManager sharedManager] configuration] valueForKey:kFarmingFieldsKey];
    
}
-(void)save
{
    [[KBConfigurationManager sharedManager]setInt:self.xPos forKey:kXPosKey];
    [[KBConfigurationManager sharedManager]setInt:self.yPos forKey:kYPosKey];
    
    [[KBConfigurationManager sharedManager]setInt:self.width forKey:kWidthKey];
    [[KBConfigurationManager sharedManager]setInt:self.height forKey:kHeightKey];
    [[KBConfigurationManager sharedManager]setSize:self.tileSize forKey:kTileSizeKey];
    [[[KBConfigurationManager sharedManager] configuration]setValue:self.farmingFields forKey:kFarmingFieldsKey];
}

@end
