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
@synthesize selectedItemStack = _selectedItemStack;

- (id)init {
    self = [super init];
    if (self) {
        self.itemStacks = [[NSMutableArray alloc] init];
        
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
        
        [self.itemStacks addObject:stack];
        
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

-(void)selectItem:(KBItem *)item
{
    for (int i = 0; i < [self.itemStacks count]; i++) {
        if ([item isEqual:[self.itemStacks objectAtIndex:i]]) {
            self.selectedItemStack = [self.itemStacks objectAtIndex:i];
        }
    }
}

@end
