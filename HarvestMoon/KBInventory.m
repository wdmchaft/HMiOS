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
@synthesize selectedItem = _selectedItem;
@synthesize selectedTool = _selectedTool;

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

-(void)selectItem:(KBItemStack *)itemStack
{
    if (itemStack.itemType.itemType == Tool) {
        self.selectedTool = itemStack;
    }
    else {
        self.selectedItem = itemStack;
    }
    
    // Da verschiedenste Objekte wissen sollten, dass das selektierte Item gewechselt hat 
    // (z.B. ItemMenu, oder das Player Objekt) wird hier mit Notifications gearbeitet und nicht mit delegates
    [[NSNotificationCenter defaultCenter] postNotificationName:kSelectedItemsChangedNotification object:self];
}

-(NSArray*)tools
{
    NSMutableArray* arr = [NSMutableArray array];
    
    for (KBItemStack* stack in self.itemStacks) {
        if (stack.itemType.itemType == Tool && ![stack isEqual:self.selectedTool]) {
            [arr addObject:stack];
        }
    }
    
    return arr;
}

-(NSArray*)items
{
    NSMutableArray* arr = [NSMutableArray array];
    
    for (KBItemStack* stack in self.itemStacks) {
        if (stack.itemType.itemType == Item && ![stack isEqual:self.selectedItem]) {
            [arr addObject:stack];
        }
    }
    
    return arr;
}

@end
