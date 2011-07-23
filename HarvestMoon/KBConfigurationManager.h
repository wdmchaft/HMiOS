//
//  KBConfigurationManager.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 12.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameConfig.h"
#import <Foundation/Foundation.h>


#pragma mark -
#pragma mark ConfigurationKeys

#define kUseDPad @"kUseDPad"

#define kDevelopmentMode @"kUseDevelopmentMode"

#define kLastSavedPlayerPosition @"LastSavedPlayerPosition" 

#define kCurrentMapName @"CurrentMapName"

#define kInventory @"Inventory"

#pragma mark -
#pragma mark Interface

@interface KBConfigurationManager : NSObject
{
#pragma mark -
#pragma mark Class Variables
    
    NSMutableDictionary* _configuration;
}

#pragma mark -
#pragma mark Properties

@property(nonatomic,retain) NSMutableDictionary* configuration;

#pragma mark -
#pragma mark Class Methods

+ (KBConfigurationManager *) sharedManager;

+(void)initialize;

#pragma mark -
#pragma mark State Handling

-(id)init;

-(void)saveConfiguration;

-(void)readConfiguration;

- (void)saveGameState;

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

-(NSString*)documentsPathForFile:(NSString*)fileName;

#pragma mark -

@end
