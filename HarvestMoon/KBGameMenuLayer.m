//
//  KBG8ameMenuLayer.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 13.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBGameMenuLayer.h"

@implementation KBGameMenuLayer
@synthesize itemBackground = _itemBackground;
@synthesize toolBackground = _toolBackground;
@synthesize itemMenuOpened = _itemMenuOpened;
@synthesize toolMenuOpened = _toolMenuOpened;
@synthesize currentlyTouchingItemMenu = _currentlyTouchingItemMenu;
@synthesize currentlyTouchingToolMenu = _currentlyTouchingToolMenu;

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
        
        
    }
    
    return self;
}

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

- (void) ccTouchEnded:(UITouch *) touch withEvent:(UIEvent *) event
{
    if (true/*ganzes Menü aufgeklappt*/) {
        //Touch auf item -> neues item "in die hand nehmen"
        //Touch ausserhalb des menüs -> menü schliessen, nichts machen
        
        
        for (KBItemStack* itemStack in self.inventory.itemStacks) {
            CCSprite* sprte = [itemStack.itemType smallSprite];
            
            [self removeChild:sprte cleanup:YES];
        }
        
    }
    else
    {
        //Touch auf item -> item verwenden
        //Touch ausserhalb items -> nichts machen
    }
    
    self.currentlyTouchingItemMenu = NO;
    self.currentlyTouchingToolMenu = NO;
    
}

-(void)showFullMenu
{
    [self unschedule:@selector(showFullMenu)];
    
    NSLog(@"HOLY CRAP");
    
    
    int yPos = 40;
    int i = 1;
    for (KBItemStack* itemStack in self.inventory.itemStacks) {
        CCSprite* sprte = [itemStack.itemType smallSprite];
        
        [sprte runAction:[CCScaleBy actionWithDuration:0.3 scale:2.5]];
        
        sprte.position = ccp(30,yPos * i);
        i++;
        [self addChild:sprte];
    }
    
    // TODO : ausklappen des item oder tool menüs
}

-(KBInventory*)inventory
{
    return [[[KBStandardGameController sharedController] player] inventory];
}

@end
