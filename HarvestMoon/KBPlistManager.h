//
//  KBPlistManager.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 12.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark -
#pragma mark Interface

@interface KBPlistManager : NSObject

#pragma mark -
#pragma mark Class Methods

+(id)readPlistFromPath:(NSString *)filePath;

+ (NSArray*)readPlistFromBundleAsArray:(NSString*)fileName;

+ (NSDictionary*)readPlistFromBundleAsDictionary:(NSString*)fileName;

+ (NSArray*)readPlistAsArray:(NSString*)filePath;

+ (NSDictionary*)readPlistAsDictionary:(NSString*)filePath;

+(void)writePlist:(id)data toFile:(NSString*)filePath;

+ (void)writePlist:(NSString*)filePath withArray:(NSArray*)data;

+ (void)writePlist:(NSString*)filePath withDictionary:(NSDictionary *)data;

#pragma mark -

@end
