//
//  KBFarmland.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 26.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBFarmland.h"

// definiert, wie viele Tiles lang / breit ein einzelnes Feld des gesamten Farmgebiet ist.
#define kSizeOfAField 2

@implementation KBFarmland

@synthesize xPos = _xPos;
@synthesize yPos = _yPos;
@synthesize height = _height;
@synthesize width = _width;
@synthesize tileSize = _tileSize;


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
        
        
    }
    
    return self;
}

@end
