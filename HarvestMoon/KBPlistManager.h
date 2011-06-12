//
//  KBPlistManager.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 12.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KBPlistManager : NSObject

+ (id)readPlist:(NSString*)fileName;
+ (NSArray*)readPlistAsArray:(NSString*)fileName;
+ (NSDictionary*)readPlistAsDictionary:(NSString*)fileName;

@end
