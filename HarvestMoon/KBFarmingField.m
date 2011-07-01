//
//  KBFarmingField.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 28.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBFarmingField.h"


@implementation KBFarmingField

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    [self addChild:[CCSprite spriteWithFile:@"can.png"]];
    
    NSLog(@"added can");
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    return [self init];
}

@end
