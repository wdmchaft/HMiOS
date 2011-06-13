//
//  KBItem.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 30.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface KBItem : NSObject {
    NSString* _name;
    CCSprite* _smallSprite;
    CCSprite* _bigSprite;
    
}

@property(nonatomic,retain)NSString*name;
@property(nonatomic,retain)CCSprite*smallSprite;
@property(nonatomic,retain)CCSprite*bigSprite;


-(id)initWithDefinitionFile:(NSString*)fileName;

@end
