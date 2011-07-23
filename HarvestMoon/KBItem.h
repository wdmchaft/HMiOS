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

#pragma mark -
#pragma mark ItemTyp Enum

enum ItemType{
    Item = 0,
    Tool = 1
} ItemType;

#pragma mark -
#pragma mark Interface

@interface KBItem : NSObject <NSCoding> {
    
#pragma mark -
#pragma mark Class Variables
    
    NSString* _fileName;
    
    NSString* _name;
    
    CCSprite* _smallSprite;
    
    CCSprite* _bigSprite;

    enum ItemType _itemType;

}

#pragma mark -
#pragma mark Properties

@property(nonatomic,retain)NSString*fileName;

@property(nonatomic,retain)NSString*name;

@property(nonatomic,retain)CCSprite*smallSprite;

@property(nonatomic,retain)CCSprite*bigSprite;

@property(nonatomic) enum ItemType itemType;

#pragma mark -
#pragma mark State Handling

-(id)initWithDefinitionFile:(NSString*)fileName;

-(id)initWithCoder:(NSCoder *)aDecoder;

-(void)encodeWithCoder:(NSCoder *)aCoder;

#pragma mark -

@end
