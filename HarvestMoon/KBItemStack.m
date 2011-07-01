//
//  KBInventoryStack.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 30.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBItemStack.h"

#define kItemType @"itemType"
#define kItemCount @"itemCount"

@implementation KBItemStack

@synthesize itemType = _itemType;
@synthesize itemCount = _itemCount;


- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder setValue:self.itemType forKey:kItemType];
    [aCoder setValue: [NSNumber numberWithInt:self.itemCount] forKey:kItemCount];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if (self) {
        self.itemType = [aDecoder valueForKey:kItemType];
        self.itemCount = [[aDecoder valueForKey:kItemCount] integerValue];
    }
    
    
    return self;
}

@end
