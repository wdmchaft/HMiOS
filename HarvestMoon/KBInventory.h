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
}

@property (nonatomic, retain) NSMutableArray* itemStacks;

-(id)init;

-(void)addItem:(KBItem*)item;
-(void)removeItem:(KBItem*)item;


@end