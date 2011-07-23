//
//  KBPlistManager.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 12.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBPlistManager.h"

@implementation KBPlistManager

+(id)readPlistFromPath:(NSString *)filePath
{
    NSLog(@"reading plist %@",filePath);
    if(![[NSFileManager defaultManager] fileExistsAtPath:filePath])
        NSLog(@"file doesn't EXIST U IDIOT!");
    
    NSData *plistData;
    NSString *error;  
    NSPropertyListFormat format;  
    id plist; 
    
    plistData = [NSData dataWithContentsOfFile:filePath]; 
    
    plist = [NSPropertyListSerialization propertyListFromData:plistData mutabilityOption:NSPropertyListImmutable format:&format errorDescription:&error];  
    if (!plist) {  
        NSLog(@"Error reading plist from file '%s', error = '%s'", [filePath UTF8String], [error UTF8String]);  
        [error release];  
    }  
    
    return plist; 
}

+ (id)readPlistFromBundle:(NSString*)fileName 
{
    NSString *localizedPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];  
      
    return [KBPlistManager readPlistFromPath:localizedPath];
}

+ (NSArray*)readPlistFromBundleAsArray:(NSString*)fileName
{
    return (NSArray*) [KBPlistManager readPlistFromBundle:fileName];
}
+ (NSDictionary*)readPlistFromBundleAsDictionary:(NSString*)fileName
{
    return (NSDictionary*) [KBPlistManager readPlistFromBundle:fileName];
}

+ (NSArray*)readPlistAsArray:(NSString*)filePath
{
    return [KBPlistManager readPlistFromPath:filePath];
}
+ (NSDictionary*)readPlistAsDictionary:(NSString*)filePath
{
    return [KBPlistManager readPlistFromPath:filePath];
}

+(void)writePlist:(id)data toFile:(NSString*)filePath
{
    NSLog(@"writing plist %@",filePath);
    
    NSData *d = [NSKeyedArchiver archivedDataWithRootObject:data];
    
    
    [[NSFileManager defaultManager] createFileAtPath:filePath contents:d attributes:nil];
}

+ (void)writePlist:(NSString*)filePath withArray:(NSArray*)data
{
    //[KBPlistManager writePlist:data toFile:filePath];
    
    if([data writeToFile:filePath atomically:YES] == NO)
        NSLog(@"critical errör!");
    
}

+ (void)writePlist:(NSString*)filePath withDictionary:(NSDictionary *)data
{
    //[KBPlistManager writePlist:data toFile:filePath];
    if([data writeToFile:filePath atomically:YES] == NO)
        NSLog(@"critical errör!");
}
@end
