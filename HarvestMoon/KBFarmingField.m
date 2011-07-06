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

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.spriteFile forKey:kSpriteFileKey];
    
    [aCoder encodeCGPoint:self.position forKey:kPositionKey];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.spriteFile = [aDecoder decodeObjectForKey:kSpriteFileKey];
        self.position = [aDecoder decodeCGPointForKey:kPositionKey];
        
        [self addChild:[CCSprite spriteWithFile:self.spriteFile]];
        
        NSLog(@"created FarminField from persistent data");
        
    }
    
    return self;
}

@end
