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

#define kInventory @"Inventory"

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

-(NSUInteger)uIntForKey:(NSString*)key;
-(void)setUInt:(NSUInteger)value forKey:(NSString*)key;

- (int)intForKey:(NSString*)key;
- (NSString*)stringForKey:(NSString*)key;
- (double)doubleForKey:(NSString*)key;
- (void)setInt:(int)value forKey:(NSString*)key;

-(CGPoint)pointForKey:(NSString*)key;
-(void)setPoint:(CGPoint)point forKey:(NSString*)key;

-(CGSize)sizeForKey:(NSString*)key;
-(void)setSize:(CGSize)size forKey:(NSString*)key;

-(void)saveValue:(id<NSCoding>)value intoFile:(NSString*)fileName;
-(id<NSCoding>)loadValueFromFile:(NSString*)fileName;
@end
