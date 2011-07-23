//
//  KBScriptingFactory.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 24.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBSEventFactory.h"


#pragma mark -
#pragma mark Implementation

@implementation KBSEventFactory

#pragma mark -
#pragma mark Class Methods

+ (id<KBEvent>) eventForObject:(NSDictionary *)object
{
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

#pragma mark -

@end
