//
//  KBInventory.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 30.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBInventory.h"

//NSCoding
#define kItemStacksKey @"_itemStacks"
#define kSelectedItemIndexKey @"_selectedItemIndex"
#define kSelectedToolIndexKey @"_selectedToolIndex"


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

-(void)setSelectedItem:(KBItemStack *)selectedItem
{
    if (selectedItem == self.selectedItem || ![self.itemStacks containsObject:selectedItem])
    {
        return;
    }
    KBItemStack *oldValue = self.selectedItem;
    _selectedItem = [selectedItem retain];
    [oldValue release];
    
    _selectedItemIndex = [self.itemStacks indexOfObject:self.selectedItem];
}

-(void)setSelectedTool:(KBItemStack *)selectedTool
{
    if (selectedTool == self.selectedTool || ![self.itemStacks containsObject:selectedTool])
    {
        return;
    }
    KBItemStack *oldValue = self.selectedTool;
    _selectedTool = [selectedTool retain];
    [oldValue release];
    
    _selectedToolIndex = [self.itemStacks indexOfObject:self.selectedTool];
    
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

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder setValue:_itemStacks forKey:kItemStacksKey];
    [aCoder setValue:[NSNumber numberWithInt:_selectedItemIndex]  forKey:kSelectedItemIndexKey];
    [aCoder setValue:[NSNumber numberWithInt:_selectedToolIndex] forKey:kSelectedToolIndexKey];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if (self) {
        self.itemStacks = [aDecoder valueForKey:kItemStacksKey];
        
        NSNumber* selItem = [aDecoder valueForKey:kSelectedItemIndexKey];
        NSNumber* selTool = [aDecoder valueForKey:kSelectedToolIndexKey];
        
        self.selectedTool = [self.itemStacks objectAtIndex:[selTool integerValue]];
        
        self.selectedItem = [self.itemStacks objectAtIndex:[selItem integerValue]];
        
        
    }
    
    return self;
}

@end
