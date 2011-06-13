//
//  KBScriptingFactory.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 24.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBSEventFactory.h"


@implementation KBSEventFactory

+ (id<KBEvent>) eventForObject:(NSDictionary *)object
{
    NSLog(@"now we should create and run the event %@", object);
    id<KBEvent> event = nil;
    switch ([[object valueForKey:kScriptingId] integerValue]) {
        case  kJumpToMap:
            event = [[KBJumpToMapEvent alloc] initWithObject:object];
            break;
        case kShowMessage: 
            event = [[KBShowMessageEvent alloc] initWithObject:object];
        case kOpenToolBox:
            //event = ...
            break;
        case kOpenToolBoxBig:
            event = [[KBShowToolBoxBigEvent alloc] initWithObject:object];
            break;
        default:
            break;
    }
    
    
    return [event autorelease];
}

@end
