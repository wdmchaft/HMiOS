//
//  KBInventoryStack.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 30.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface KBItemStack : NSObject {
    NSArray* _items;
}

@property (nonatomic, retain) NSArray* items;

@end
