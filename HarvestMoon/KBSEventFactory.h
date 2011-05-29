//
//  KBScriptingFactory.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 24.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScriptingIdentifiers.h"
#import "GameConfig.h"
#import "KBEvent.h"
#import "KBJumpToMapEvent.h"
#import "KBShowMessageEvent.h"

@interface KBSEventFactory : NSObject {
    
}
+ (id<KBEvent>) eventForObject:(NSDictionary *)object;

@end
