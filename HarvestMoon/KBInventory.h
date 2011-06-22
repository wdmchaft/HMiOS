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


#define kSelectedItemsChangedNotification @"SelectedItemsChangedNotification"

@interface KBInventory : NSObject {
    NSMutableArray* _itemStacks;
    
    KBItemStack* _selectedItem;
    KBItemStack* _selectedTool;
    
}

@property (nonatomic, retain) NSMutableArray* itemStacks;
@property (nonatomic,retain) KBItemStack* selectedTool;
@property (nonatomic,retain) KBItemStack* selectedItem;


-(id)init;

-(void)addItem:(KBItem*)item;
-(void)removeItem:(KBItem*)item;

-(void)selectItem:(KBItem*)item;

-(NSArray*)tools;
-(NSArray*)items;


@end