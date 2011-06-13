//
//  KBConfigurationManager.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 12.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameConfig.h"
#import <Foundation/Foundation.h>

/* Available Configurations  */
#ifndef Available_Configurations
#define Available_Configurations

#define kUseDPad @"kUseDPad"

#define kDevelopmentMode @"kUseDevelopmentMode"

#define kLastSavedPlayerPosition @"LastSavedPlayerPosition" 

#define kCurrentMapName @"CurrentMapName"

#endif

@interface KBConfigurationManager : NSObject
{
    NSMutableDictionary* _configuration;
}

@property(nonatomic,retain) NSMutableDictionary* configuration;

+ (KBConfigurationManager *) sharedManager;
-(void)saveConfiguration;
-(void)readConfiguration;

#pragma mark -
#pragma mark Convencience Methods

- (int)intForKey:(NSString*)key;
- (NSString*)stringForKey:(NSString*)key;
- (double)doubleForKey:(NSString*)key;
- (void)setInt:(int)value forKey:(NSString*)key;
@end
