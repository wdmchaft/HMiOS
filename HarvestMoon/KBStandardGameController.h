//
//  StandardGameController.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 15.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "KBTMXTiledMap.h"

@interface KBStandardGameController : NSObject {
    CCLayer* _gameLayer;    
    KBTMXTiledMap* _tileMap;
}

+(KBStandardGameController *)sharedController;


@property(nonatomic,retain) CCLayer* gameLayer;



@end
