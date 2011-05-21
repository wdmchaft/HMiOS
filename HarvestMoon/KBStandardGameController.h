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

@interface KBStandardGameController : NSObject {
    
    CCLayer* _gameLayer;    
    
}

#pragma mark -
#pragma mark Properties

@property(nonatomic, retain) CCLayer* gameLayer;

#pragma mark -
#pragma mark Class Methods

+ (void) initialize;

+ (KBStandardGameController *) sharedController;

#pragma mark -

@end
