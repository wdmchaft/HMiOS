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

#pragma mark -
#pragma mark Interface

@interface KBGameMenuLayer : CCLayer
{
    
#pragma mark -
#pragma mark Class Variables
    
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

#pragma mark -
#pragma mark Properties

@property(nonatomic,retain) CCScaleBy* scalingAction;

@property(nonatomic,retain) CCSprite* itemBackground;

@property(nonatomic,retain) CCSprite* toolBackground;

@property(nonatomic,retain) KBItemStack* selectedTool;

@property(nonatomic,retain) KBItemStack* selectedItem;

@property(nonatomic) BOOL itemMenuOpened;

@property(nonatomic) BOOL toolMenuOpened;

@property(nonatomic) BOOL currentlyTouchingItemMenu;

@property(nonatomic) BOOL currentlyTouchingToolMenu;

#pragma mark -
#pragma mark State Handling

-(id)init;

#pragma mark -
#pragma mark Convenience Methods

-(KBInventory*)inventory;

-(NSArray*)itemsToShow;

#pragma mark -
#pragma mark Touch Handling

-(void)registerWithTouchDispatcher;

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event;

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event;

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event;

#pragma mark -
#pragma mark Item Menu Handling

-(void)handleSelectedItemChangedNotification:(NSNotification*)notification;

-(void)removeSprites;

-(int)findTouchedItemWithTouch:(UITouch*)touch;

-(void)hideFullMenu;

-(void)showFullMenu;

#pragma mark -

@end
