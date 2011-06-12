//
//  KBOptionsScreen.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 12.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBOptionsScreen.h"


@implementation KBOptionsScreen
@synthesize menu = _menu;
@synthesize menuItemSteeringMethod = _menuItemSteeringMethod;
@synthesize menuItemDevelopmentMode = _menuItemDevelopmentMode;

+(CCScene*)scene
{
    // 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	KBOptionsScreen *layer = [KBOptionsScreen node];
    
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
        
        //DPad / Direct Touch
        CCMenuItemLabel* dpad = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Use D-Pad" fontName:font fontSize:fontSize]];
        CCMenuItemLabel* directTouch = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Touch to walk" fontName:font fontSize:fontSize]];
        CCMenuItemToggle* menuItemSteeringMethod = [CCMenuItemToggle itemWithTarget:self selector:@selector(useDPad) items:dpad,directTouch, nil];
        
        
        CCMenuItemLabel* devDisabled = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Development Mode: Disabled" fontName:font fontSize:fontSize]];
        CCMenuItemLabel* devEnabled = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Development Mode: Enabled" fontName:font fontSize:fontSize]];
        CCMenuItemToggle* menuItemDevelopmentMode = [CCMenuItemToggle itemWithTarget:self selector:@selector(useDevelopmentMode) items:devDisabled,devEnabled, nil];
        
        
        
        
        CCMenuItemLabel* menuItemExit = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Back to Main Menu" fontName:font fontSize:fontSize] target:self selector:@selector(exit)];
        
        menuItemSteeringMethod.position = ccp(0,100);
        
        menuItemDevelopmentMode.position = ccp(0,50);
        
        menuItemExit.position = ccp(0,0);
        
        
        CCMenu* menu = [CCMenu menuWithItems:menuItemSteeringMethod,menuItemDevelopmentMode,menuItemExit, nil];
        
        [self addChild:menu];
        self.menuItemSteeringMethod = menuItemSteeringMethod;
        self.menuItemDevelopmentMode = menuItemDevelopmentMode;
        self.menu = menu;
        
    }
    
    return self;
}

-(void)useDevelopmentMode
{
    CCLOG(@"Set kDevelopmentMode to: %i",self.menuItemDevelopmentMode.selectedIndex);
    [[KBConfigurationManager sharedManager] 
     setInt:self.menuItemDevelopmentMode.selectedIndex 
     forKey:kDevelopmentMode];
}

-(void)useDPad
{
    int useDPad = self.menuItemSteeringMethod.selectedIndex == 1 ? 0 : 1;
    CCLOG(@"Set useDPad to: %i",useDPad);
    [[KBConfigurationManager sharedManager]setInt:useDPad forKey:kUseDPad];
}


-(void)exit
{
    [[CCDirector sharedDirector] popScene];
}


@end
