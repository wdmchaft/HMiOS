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

#pragma mark -
#pragma mark Interface

@interface KBOptionsScreen : CCLayer {

#pragma mark -
#pragma mark Class Variables
    
    CCMenu* _menu;
    
    CCMenuItemToggle* _menuItemSteeringMethod;
    
    CCMenuItemToggle* _menuItemDevelopmentMode;
    
}

#pragma mark -
#pragma mark Properties

@property(nonatomic,retain) CCMenu* menu;

@property(nonatomic,retain) CCMenuItemToggle* menuItemSteeringMethod;

@property(nonatomic,retain) CCMenuItemToggle* menuItemDevelopmentMode;

#pragma mark -
#pragma mark State Handling

+(CCScene*)scene;

-(id)init;

#pragma mark -
#pragma mark Menu Handling

-(void)useDevelopmentMode;

-(void)useDPad;

-(void)exit;

#pragma mark -

@end
