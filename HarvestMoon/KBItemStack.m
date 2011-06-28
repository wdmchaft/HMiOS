//
//  KBInventoryStack.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 30.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBItemStack.h"

//NSCoding
#define kItemTypeKey @"_itemType"
#define kItemCountKey @"_itemCount"

@implementation KBItemStack

@synthesize itemType = _itemType;
@synthesize itemCount = _itemCount;


- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if (self) {
        self.itemType = [aDecoder valueForKey:kItemTypeKey];
        self.itemCount = [(NSNumber*)[aDecoder valueForKey:kItemCountKey] integerValue];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder setValue:self.itemType forKey:kItemTypeKey];
    [aCoder setValue:[NSNumber numberWithInt:self.itemCount] forKey:kItemCountKey];
}

@end
