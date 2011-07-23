//
//  KBFarmingField.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 28.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBFarmingField.h"

#define kSpriteFileKey @"spriteFile"
#define kPositionKey @"position"

@implementation KBFarmingField

@synthesize spriteFile = _spriteFile;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    
    if (self.spriteFile == nil) {
        
        switch (arc4random() % 2) {
            case 0:
                self.spriteFile = @"can.png";
                break;
            case 1:
                self.spriteFile = @"hoe.png";
                break;
            default:
                break;
        }
        
    }
    [self addChild:[CCSprite spriteWithFile:self.spriteFile]];
        
    return self;
}

-(id)initWithDataRepresentation:(NSDictionary *)dataRepresentation
{
    self = [super init];
    if (self) {
        
        self.position = CGPointFromString([dataRepresentation objectForKey:kPositionKey]);        
        self.spriteFile = [dataRepresentation objectForKey:kSpriteFileKey];
        [self addChild:[CCSprite spriteWithFile:self.spriteFile]];
    }
    
    return self;
}

-(NSDictionary*)dataRepresentation
{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    
    [dict setObject:self.spriteFile forKey:kSpriteFileKey];
    [dict setObject:NSStringFromCGPoint(self.position) forKey:kPositionKey];
    
    return dict;
}

@end
