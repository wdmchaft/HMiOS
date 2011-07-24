//
//  KBG8ameMenuLayer.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 13.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBGameMenuLayer.h"
#import "KBPlayer.h"

#pragma mark -
#pragma mark Implementation

@implementation KBGameMenuLayer

#pragma mark -
#pragma mark Properties

@synthesize itemBackground = _itemBackground;

@synthesize toolBackground = _toolBackground;

@synthesize itemMenuOpened = _itemMenuOpened;

@synthesize toolMenuOpened = _toolMenuOpened;

@synthesize currentlyTouchingItemMenu = _currentlyTouchingItemMenu;

@synthesize currentlyTouchingToolMenu = _currentlyTouchingToolMenu;

@synthesize scalingAction = _scalingAction;

@synthesize selectedItem = _selectedItem;

@synthesize selectedTool = _selectedTool;

#pragma mark -
#pragma mark State Handling

- (id)init
{
    self = [super init];
    if (self) {
        
        self.itemMenuOpened = NO;
        self.toolMenuOpened = NO;
        
        self.currentlyTouchingItemMenu = NO;
        self.currentlyTouchingToolMenu = NO;
        
        self.isTouchEnabled = YES;
        
        // Initialization code here.
        self.itemBackground = [CCSprite spriteWithFile:@"inventory_background.png"];
        self.toolBackground = [CCSprite spriteWithFile:@"inventory_background.png"];
        
        [self.itemBackground runAction:[CCScaleBy actionWithDuration:0 scale:3]];
        [self.toolBackground runAction:[CCScaleBy actionWithDuration:0 scale:3]];
        
        self.itemBackground.position = ccp(30,30);
        self.toolBackground.position = ccp(30,90);
        
        
        [self addChild:self.itemBackground];
        [self addChild:self.toolBackground];
        
        self.scalingAction = [CCScaleBy actionWithDuration:0.3 scale:2.5];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleSelectedItemChangedNotification:) name:kSelectedItemsChangedNotification object:nil];
        
    }
    
    return self;
}

#pragma mark -
#pragma mark Convenience Methods

-(KBInventory*)inventory
{
    return [[[KBStandardGameController sharedController] player] inventory];
}

- (NSArray *)itemsToShow 
{
    NSArray* itemsToShow = nil;
    if (self.currentlyTouchingItemMenu || self.itemMenuOpened) {
        itemsToShow = self.inventory.items;
    }
    if (self.currentlyTouchingToolMenu || self.toolMenuOpened) {
        itemsToShow = self.inventory.tools;
    }
    NSAssert(itemsToShow != nil, @"The Array that should contain items was nil!");
    return itemsToShow;
}

#pragma mark -
#pragma mark Touch Handling

- (void) registerWithTouchDispatcher
{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

- (BOOL) ccTouchBegan:(UITouch *) touch withEvent:(UIEvent *) event
{
    if(CGRectContainsPoint(self.itemBackground.textureRect, [self.itemBackground convertTouchToNodeSpace:touch]))
    {
        self.currentlyTouchingItemMenu = YES;
        [self schedule:@selector(showFullMenu) interval:2];
        return YES;
    }
    
    if(CGRectContainsPoint(self.toolBackground.textureRect, [self.toolBackground convertTouchToNodeSpace:touch]))
    {
        self.currentlyTouchingToolMenu = YES;
        [self schedule:@selector(showFullMenu) interval:2];
        return YES;
    }
    
    return NO;
}

- (void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    
    for (KBItemStack* itemStack in self.inventory.itemStacks) {
        CCSprite* sprte = itemStack.itemType.bigSprite;
        
        if (CGRectContainsPoint(itemStack.itemType.smallSprite.textureRect, [itemStack.itemType.smallSprite convertTouchToNodeSpace:touch]) ) {
            sprte.position = ccp([[CCDirector sharedDirector] winSize].width / 2,[[CCDirector sharedDirector] winSize].height/2);
            
            if (![self.children containsObject:sprte]) {
                [self addChild:sprte];
            }
        }
        else
        {
            [self removeChild:sprte cleanup:NO];
        }
        
    }
}

- (void) ccTouchEnded:(UITouch *) touch withEvent:(UIEvent *) event
{
    if (self.itemMenuOpened || self.toolMenuOpened) {
        
        int touchedItemIndex = [self findTouchedItemWithTouch:touch];
        
        if (touchedItemIndex == -1) {
            //Index ist -1, wenn kein Item berührt wurde.
            [self hideFullMenu];
            NSLog(@"Kein Item berührt, schliesse Menü");
            return;
        }
        
        [self.inventory selectItemStack:[self.itemsToShow objectAtIndex:touchedItemIndex]];
        
        [self hideFullMenu];
    }
    else
    {
        if(CGRectContainsPoint(self.itemBackground.textureRect, [self.itemBackground convertTouchToNodeSpace:touch]))
        {
            [((KBPlayer*)[KBStandardGameController sharedController].player) useItem:self.inventory.selectedItem];
        } 
        else if (CGRectContainsPoint(self.toolBackground.textureRect, [self.toolBackground convertTouchToNodeSpace:touch]))
        {
            [((KBPlayer*)[KBStandardGameController sharedController].player) useItem:self.inventory.selectedTool];            
        }
        else
        {
            //Touch endete nicht auf einem der Item-Plätze, es muss nichts gemacht werden
            NSLog(@"Item benutzen abgebrochen");
        
        }
        
    }
    
    self.currentlyTouchingItemMenu = NO;
    self.currentlyTouchingToolMenu = NO;
    
}

#pragma mark -
#pragma mark Item Menu Handling

-(void)handleSelectedItemChangedNotification:(NSNotification*)notification
{
    [self removeChild:self.selectedItem.itemType.smallSprite cleanup:YES];
    [self removeChild:self.selectedTool.itemType.smallSprite cleanup:YES];
    
    self.selectedTool = self.inventory.selectedTool;
    self.selectedItem = self.inventory.selectedItem;
    
    if(self.selectedItem != nil) 
    {
        [self removeChild:self.selectedItem.itemType.smallSprite cleanup:YES];
        [self addChild:self.selectedItem.itemType.smallSprite];
        
        self.selectedItem.itemType.smallSprite.position = ccp(30,30);
    }
    
    
    if(self.selectedTool != nil) {
        
        [self removeChild:self.selectedTool.itemType.smallSprite cleanup:YES];
        [self addChild:self.selectedTool.itemType.smallSprite];
        
        self.selectedTool.itemType.smallSprite.position = ccp(30,90);
    }
}

-(void)removeSprites
{
    [self unschedule:@selector(removeSprites)];
    for (KBItemStack* itemStack in self.itemsToShow) {
        CCSprite* sprte = [itemStack.itemType smallSprite];
        
        [self removeChild:sprte cleanup:YES];
        
    }
    
    // Die Menüs gelten erst als geschlossen, wenn alle Icons nicht mehr sichtbar sind!
    self.itemMenuOpened = NO;
    self.toolMenuOpened = NO;
}

-(void)hideFullMenu
{
    for (KBItemStack* itemStack in self.itemsToShow) {
        CCSprite* sprte = [itemStack.itemType smallSprite];
        sprte.scale = 1;
    }
    for (KBItemStack* itemStack in self.inventory.itemStacks) {
        CCSprite* sprte = itemStack.itemType.bigSprite;
        
        if ([self.children containsObject:sprte]) {
            [self removeChild:sprte cleanup:YES];
        }
        
    }
    
    [self removeSprites];
}

-(int)findTouchedItemWithTouch:(UITouch*)touch
{
    int index = -1;
    NSArray *itemsToShow;
    itemsToShow = [self itemsToShow];    
    
    int counter = 0;
    for (KBItemStack* stack in itemsToShow) {
        if (CGRectContainsPoint(stack.itemType.smallSprite.textureRect, [stack.itemType.smallSprite convertTouchToNodeSpace:touch])) {
            index = counter;
        }
        counter++;
    }
    
    
    return index;
}

-(void)showFullMenu
{
    [self unschedule:@selector(showFullMenu)];
    
    NSLog(@"HOLY CRAP");
    
    
    int yPos = 40;
    int i = 1;
    NSArray* itemsToShow = [self itemsToShow];
    
    for (KBItemStack* itemStack in itemsToShow) {
        CCSprite* sprte = [itemStack.itemType smallSprite];
        
        [sprte runAction:[self.scalingAction copy]];
        
        sprte.position = ccp(70,yPos * i);
        i++;
        [self addChild:sprte];
    }
    
    self.itemMenuOpened = self.currentlyTouchingItemMenu;
    self.toolMenuOpened = self.currentlyTouchingToolMenu;
    
}

#pragma mark -

@end
