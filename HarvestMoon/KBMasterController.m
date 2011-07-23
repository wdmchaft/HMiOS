//
//  KBMasterController.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 01.07.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBMasterController.h"
#import "GameConfig.h"

#pragma mark -
#pragma mark Implementation

@implementation KBMasterController

#pragma mark -
#pragma mark Properties

@synthesize mainMenuLayer = _mainMenuLayer;

@synthesize gameLayer = _gameLayer;

@synthesize gameMenuLayer = _gameMenuLayer;

@synthesize interactionHandler = _interactionHandler;

#pragma mark -
#pragma mark Static Objects

static KBMasterController* _sharedSingleton;

#pragma mark -
#pragma mark State Handling

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

#pragma mark -
#pragma mark Class Methods

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

#pragma mark -
#pragma mark Game Handling

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

    NSArray* files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[[KBConfigurationManager sharedManager] documentsPathForFile:@""] error:nil];
    
    for (NSString* file in files) {
        [[NSFileManager defaultManager] removeItemAtPath:file error:nil];
    }
    
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

#pragma mark -

@end
