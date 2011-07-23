//
//  KBInventory.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 30.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KBItem.h"
#import "KBItemStack.h"

#pragma mark -
#pragma mark NotificationConstants

#define kSelectedItemsChangedNotification @"SelectedItemsChangedNotification"

#pragma mark -
#pragma mark Interface

@interface KBInventory : NSObject {
    
#pragma mark -
#pragma mark Class Variables
    
    NSMutableArray* _itemStacks;
    
    KBItemStack* _selectedItem;

    KBItemStack* _selectedTool;
    
}

#pragma mark -
#pragma mark Properties

@property (nonatomic, retain) NSMutableArray* itemStacks;

@property (nonatomic,retain) KBItemStack* selectedTool;

@property (nonatomic,retain) KBItemStack* selectedItem;

#pragma mark -
#pragma mark State Handling

-(id)init;

-(void)load;

-(void)save;

#pragma mark -
#pragma mark Item Handling

-(void)addItem:(KBItem*)item;

-(void)removeItem:(KBItem*)item;

-(void)selectItemStack:(KBItemStack*)item;

-(NSArray*)tools;

-(NSArray*)items;

#pragma mark -

@end