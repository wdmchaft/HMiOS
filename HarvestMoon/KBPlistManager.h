//
//  KBPlistManager.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 12.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KBPlistManager : NSObject

+ (NSArray*)readPlistAsArray:(NSString*)fileName;
+ (NSDictionary*)readPlistAsDictionary:(NSString*)fileName;
+ (void)writePlist:(NSString*)fileName withArray:(NSArray*)data;
+ (void)writePlist:(NSString*)fileName withDictionary:(NSDictionary *)data;
@end
