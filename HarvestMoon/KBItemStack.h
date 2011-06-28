//
//  KBInventoryStack.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 30.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KBItem.h"

@interface KBItemStack : NSObject <NSCoding>{
    KBItem* _itemType;
    int _itemCount;
}
-(id)init;

@property (nonatomic, retain) KBItem* itemType;
@property (nonatomic) int itemCount;

@end
