//
//  KBMainMenuScene.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 12.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBMainMenuScene.h"


@implementation KBMainMenuScene

+ (CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	KBMainMenuScene *layer = [KBMainMenuScene node];
	    
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


-(id)init
{
    self = [super init];
    if (self != nil) {
        
        NSString* font = @"Marker Felt";
        int fontSize = 20;
        
        
        CCMenuItemLabel* menuItemContinue = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Continue" 
                                                                                          fontName:font 
                                                                                          fontSize:fontSize] 
                                                                target:self 
                                                              selector:@selector(continueGame)];
        
        CCMenuItemLabel* menuItemNewGame = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"New Game" 
                                                                                          fontName:font 
                                                                                          fontSize:fontSize] 
                                                                target:self 
                                                              selector:@selector(newGame)];
        
        CCMenuItemLabel* menuItemOptions = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Options" 
                                                                                          fontName:font 
                                                                                          fontSize:fontSize] 
                                                                target:self 
                                                              selector:@selector(showOptionScreen)];
        
        
        CCMenu* menu = [CCMenu menuWithItems:menuItemContinue,menuItemNewGame,menuItemOptions, nil];
        
        menuItemContinue.position = ccp(0,100);
        menuItemNewGame.position = ccp(0,50);
        menuItemOptions.position = ccp(0,0);
        
        [self addChild:menu];
    }
    
    return self;
}

-(void)newGame
{
    
}

-(void)continueGame
{
    [[CCDirector sharedDirector] replaceScene:[KBGameLayer scene]];
}

-(void)showOptionScreen
{
    [[CCDirector sharedDirector] pushScene:[KBOptionsScreen scene]];
}


@end
