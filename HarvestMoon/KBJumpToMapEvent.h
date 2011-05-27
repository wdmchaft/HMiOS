//
//  KBJumpToMapEvent.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 26.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KBEvent.h"

@interface KBJumpToMapEvent : NSObject <KBEvent> {
    
    NSString* _mapName;
    
}

@property(nonatomic,retain) NSString* mapName;

-(id)initWithObject:(NSDictionary *)object;

-(void)run;

@end
