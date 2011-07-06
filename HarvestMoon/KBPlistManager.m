//
//  KBPlistManager.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 12.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBPlistManager.h"

@implementation KBPlistManager

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}



+ (id)readPlist:(NSString*)fileName
{
    NSData *plistData;  
    NSString *error;  
    NSPropertyListFormat format;  
    id plist;  
    
    NSString *localizedPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];  
    plistData = [NSData dataWithContentsOfFile:localizedPath];   
    
    plist = [NSPropertyListSerialization propertyListFromData:plistData mutabilityOption:NSPropertyListImmutable format:&format errorDescription:&error];  
    if (!plist) {  
        NSLog(@"Error reading plist from file '%s', error = '%s'", [localizedPath UTF8String], [error UTF8String]);  
        [error release];  
    }  
    
    return plist; 
}
+ (NSArray*)readPlistAsArray:(NSString*)fileName
{
    return (NSArray*) [KBPlistManager readPlist:fileName];
}
+ (NSDictionary*)readPlistAsDictionary:(NSString*)fileName
{
    return (NSDictionary*) [KBPlistManager readPlist:fileName];
}

+ (void)writePlist:(NSString*)fileName withArray:(NSArray*)data
{
    NSData *d = [NSKeyedArchiver archivedDataWithRootObject:data];
    
    
    [[NSFileManager defaultManager] createFileAtPath:fileName contents:d attributes:nil];
}

+ (void)writePlist:(NSString*)fileName withDictionary:(NSDictionary *)data
{
    NSData *d = [NSKeyedArchiver archivedDataWithRootObject:data];
    
    [[NSFileManager defaultManager] createFileAtPath:fileName contents:d attributes:nil];
}
@end
