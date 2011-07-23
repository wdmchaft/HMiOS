//
//  KBInventoryStack.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 30.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBItemStack.h"

#pragma mark -
#pragma mark ConfigurationKeys

#define kItemType @"itemType"

#define kItemCount @"itemCount"

#pragma mark -
#pragma mark Implementation

@implementation KBItemStack

#pragma mark -
#pragma mark Properties

@synthesize itemType = _itemType;
@synthesize itemCount = _itemCount;

#pragma mark -
#pragma mark State Handling

- (id)init {
    return [self initWithItemType:nil count:0];
}

-(id)initWithItemType:(KBItem*)itemType count:(int)itemCount
{
    self = [super init];
    
    if (self) {
        self.itemType = itemType;
        self.itemCount = itemCount;
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    return [self initWithItemType:[aDecoder valueForKey:kItemType] count:[[aDecoder valueForKey:kItemCount] integerValue]];
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder setValue:self.itemType forKey:kItemType];
    [aCoder setValue: [NSNumber numberWithInt:self.itemCount] forKey:kItemCount];
}

#pragma mark -

@end
