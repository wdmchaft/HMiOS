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

@interface KBInventory : NSObject {
    NSMutableArray* _itemStacks;
    
    KBItemStack* _selectedItemStack;
    
}

@property (nonatomic, retain) NSMutableArray* itemStacks;
@property (nonatomic,retain) KBItemStack* selectedItemStack;

-(id)init;

-(void)addItem:(KBItem*)item;
-(void)removeItem:(KBItem*)item;

-(void)selectItem:(KBItem*)item;

@end