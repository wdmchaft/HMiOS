//
//  StandardGameController.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 15.05.11.
//  Copyright 2011 KBDevers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "KBTMXTiledMap.h"

#pragma mark -
#pragma mark Forward Declarations

@class KBGameLayer;
@class KBPlayer;

#pragma mark -
#pragma mark Interface

@interface KBStandardGameController : NSObject {
    
#pragma mark -
#pragma mark Class Variables
    
    KBGameLayer* _gameLayer;    
    
    KBPlayer* _player;
    
}

#pragma mark -
#pragma mark Properties

@property(nonatomic, retain) KBGameLayer* gameLayer;

@property(nonatomic,retain) KBPlayer* player;

#pragma mark -
#pragma mark Class Methods

+ (void) initialize;

+ (KBStandardGameController *) sharedController;

#pragma mark -

@end
