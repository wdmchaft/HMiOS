//
//  KBInventory.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 30.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface KBInventory : NSObject {
    NSArray* _itemStacks;
}

@property (nonatomic, retain) NSArray* itemStacks;

-(id)init;

@end
