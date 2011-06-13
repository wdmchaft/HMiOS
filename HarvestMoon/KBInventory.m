//
//  KBInventory.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 30.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBInventory.h"

@implementation KBInventory

@synthesize itemStacks = _itemStacks;


- (id)init {
    self = [super init];
    if (self) {
        
        
    }
    return self;
}

-(void)addItem:(KBItem*)item
{
    KBItemStack* stack = nil;
    
    for (int i = 0; i < [self.itemStacks count]; i++) {
        if ([item isEqual:[self.itemStacks objectAtIndex:i]]) {
            stack = [self.itemStacks objectAtIndex:i];
        }
    }
    
    if (stack != nil) {
        stack.itemCount++;
    }
    else
    {
        KBItemStack* stack = [[KBItemStack alloc] init];
        stack.itemType = item;
        stack.itemCount = 1;
    }
}
-(void)removeItem:(KBItem*)item
{
    KBItemStack* stack = nil;
    
    for (int i = 0; i < [self.itemStacks count]; i++) {
        if ([item isEqual:[self.itemStacks objectAtIndex:i]]) {
            stack = [self.itemStacks objectAtIndex:i];
        }
    }
    
    if (stack != nil) {
        stack.itemCount--;
        if (stack.itemCount <= 0) {
            [self.itemStacks removeObject:stack];
        }
        
    }
}

@end
