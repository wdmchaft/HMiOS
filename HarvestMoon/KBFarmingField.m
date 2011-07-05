//
//  KBFarmingField.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 28.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBFarmingField.h"

#define kSpriteFile @"spriteFile"

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
    
    NSLog(@"added farming field");
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder setValue:self.spriteFile forKey:kSpriteFile];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.spriteFile = [aDecoder valueForKey:kSpriteFile];
        [self addChild:[CCSprite spriteWithFile:self.spriteFile]];
        
        NSLog(@"added farming field");
    }
    
    return self;
}

@end
