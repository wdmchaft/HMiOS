//
//  KBMasterController.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 01.07.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBMasterController.h"
#import "GameConfig.h"

@implementation KBMasterController

@synthesize mainMenuLayer = _mainMenuLayer;
@synthesize gameLayer = _gameLayer;
@synthesize gameMenuLayer = _gameMenuLayer;
@synthesize interactionHandler = _interactionHandler;

static KBMasterController* _sharedSingleton;

-(id)init
{
    if (_sharedSingleton) {
        return _sharedSingleton;
    }
    
    
    self = [super init];
    if (self) {
        
    }
    _sharedSingleton = self;
    return self;
}

+ (KBMasterController *) sharedController
{
    return _sharedSingleton;
}

+(CCScene*)scene
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];

    KBMasterController* masterController;
    if (_sharedSingleton) {
        masterController = _sharedSingleton;
    }
    else
    {
        masterController = [[KBMasterController alloc] init];
    }
    [scene addChild:masterController];
    
    
    // return the scene
    return scene;
}

-(void)showMenu
{
    if (self.mainMenuLayer == nil) {
        self.mainMenuLayer = [[KBMainMenuLayer alloc] init];
    }
    if(![self.children containsObject:self.mainMenuLayer])
        [self addChild:self.mainMenuLayer];
}

-(void)saveGame
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kSaveGameNotification object:self];
}
-(void)loadGame
{
    NSLog(@"sending load message");
    [[NSNotificationCenter defaultCenter] postNotificationName:kLoadGameNotification object:self];
}
- (void)setUpGameLayer {
    
    if([self.children containsObject:self.mainMenuLayer])
        [self removeChild:self.mainMenuLayer cleanup:YES];
    
    if (self.gameLayer == nil) {
        self.gameLayer = [[KBGameLayer alloc] init];
        
    }
    
    if (self.gameMenuLayer == nil) {
        self.gameMenuLayer = [KBGameMenuLayer node];
    }
    
    if (self.interactionHandler == nil) {
        self.interactionHandler = [KBInteractionHandler node];
    }
    
    self.interactionHandler.delegate = self.gameLayer;
    
    [self addChild:self.gameLayer];
    [self addChild:self.interactionHandler];
    [self addChild:self.gameMenuLayer];
}
-(void)newGame
{
    [[[KBConfigurationManager sharedManager] configuration] setObject:@"Jacks_House.tmx" forKey:kCurrentMapName];
    [[KBConfigurationManager sharedManager] setPoint:ccp(200,100) forKey:kLastSavedPlayerPosition];
    
    
    [self setUpGameLayer];

    [self loadGame];

    KBInventory* inv = [[KBInventory alloc] init];
    
    KBItem* item = [[KBItem alloc] initWithDefinitionFile:@"can"];
    
    [inv addItem:item];
    
    KBItem* item2 = [[KBItem alloc] initWithDefinitionFile:@"hoe"];
    
    [inv addItem:item2];
    
    self.gameLayer.player.inventory = inv;
    
}


@end
