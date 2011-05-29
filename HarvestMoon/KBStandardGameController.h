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

@class KBGameLayer;
@class KBPlayer;

@interface KBStandardGameController : NSObject {
    
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
