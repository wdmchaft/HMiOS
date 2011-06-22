//
//  KBG8ameMenuLayer.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 13.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "KBStandardGameController.h"
#import "KBInventory.h"

@interface KBGameMenuLayer : CCLayer
{
    BOOL _itemMenuOpened;
    BOOL _toolMenuOpened;
    
    BOOL _currentlyTouchingItemMenu;
    BOOL _currentlyTouchingToolMenu;
    
    CCSprite* _itemBackground;
    CCSprite* _toolBackground;
    
    KBItemStack* _selectedTool;
    KBItemStack* _selectedItem;
    
    CCScaleBy* _scalingAction;
    
}

-(void)handleSelectedItemChangedNotification:(NSNotification*)notification;

@property(nonatomic,retain) CCScaleBy* scalingAction;

@property(nonatomic,retain) CCSprite* itemBackground;
@property(nonatomic,retain) CCSprite* toolBackground;

@property(nonatomic,retain) KBItemStack* selectedTool;
@property(nonatomic,retain) KBItemStack* selectedItem;


@property(nonatomic) BOOL itemMenuOpened;
@property(nonatomic) BOOL toolMenuOpened;

@property(nonatomic) BOOL currentlyTouchingItemMenu;
@property(nonatomic) BOOL currentlyTouchingToolMenu;

-(KBInventory*)inventory;

-(int)findTouchedItemWithTouch:(UITouch*)touch;

-(NSArray*)itemsToShow;

-(void)hideFullMenu;

@end
