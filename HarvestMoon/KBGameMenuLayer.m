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


- (id)init
{
    self = [super init];
    if (self) {
        
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
    [self schedule:@selector(showFullMenu) interval:2];
    
    return YES;
}

- (void) ccTouchEnded:(UITouch *) touch withEvent:(UIEvent *) event
{
    if (true/*ganzes Menü aufgeklappt*/) {
        //Touch auf item -> neues item "in die hand nehmen"
        //Touch ausserhalb des menüs -> menü schliessen, nichts machen
    }
    else
    {
        //Touch auf item -> item verwenden
        //Touch ausserhalb items -> nichts machen
    }
}

-(void)showFullMenu
{
    [self unschedule:@selector(showFullMenu)];
    
    // TODO : ausklappen des item oder tool menüs
}


@end
