//
//  KBInventoryStack.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 30.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KBItem.h"

#pragma mark -
#pragma mark Interface

@interface KBItemStack : NSObject <NSCoding>{
    
#pragma mark -
#pragma mark Class Variables
    
    KBItem* _itemType;

    int _itemCount;

}

#pragma mark -
#pragma mark Properties

@property (nonatomic, retain) KBItem* itemType;

@property (nonatomic) int itemCount;

#pragma mark -
#pragma mark State Handling

-(id)init;

-(id)initWithItemType:(KBItem*)itemType count:(int)itemCount;

-(void)encodeWithCoder:(NSCoder *)aCoder;

-(id)initWithCoder:(NSCoder *)aDecoder;

#pragma mark -

@end
