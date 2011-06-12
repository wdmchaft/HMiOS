//
//  KBOptionsScreen.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 12.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "KBConfigurationManager.h"

@interface KBOptionsScreen : CCLayer {
    CCMenu* _menu;
    CCMenuItemToggle* _menuItemSteeringMethod;
    CCMenuItemToggle* _menuItemDevelopmentMode;
}

@property(nonatomic,retain) CCMenu* menu;
@property(nonatomic,retain) CCMenuItemToggle* menuItemSteeringMethod;
@property(nonatomic,retain) CCMenuItemToggle* menuItemDevelopmentMode;


+(CCScene*)scene;

@end
