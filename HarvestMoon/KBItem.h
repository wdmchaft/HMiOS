//
//  KBItem.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 30.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "KBPlistManager.h"

enum ItemType{
    Item = 0,
    Tool = 1
} ItemType;

@interface KBItem : NSObject {
    NSString* _name;
    CCSprite* _smallSprite;
    CCSprite* _bigSprite;
    enum ItemType _itemType;
}

@property(nonatomic,retain)NSString*name;
@property(nonatomic,retain)CCSprite*smallSprite;
@property(nonatomic,retain)CCSprite*bigSprite;
@property(nonatomic) enum ItemType itemType;


-(id)initWithDefinitionFile:(NSString*)fileName;

@end
