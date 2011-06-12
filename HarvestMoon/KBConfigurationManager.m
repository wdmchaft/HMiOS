//
//  KBConfigurationManager.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 12.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBConfigurationManager.h"

@implementation KBConfigurationManager

@synthesize configuration = _configuration;

static KBConfigurationManager* _sharedSingleton;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

#pragma mark -
#pragma mark Class Methods

+ (void) initialize
{
    static BOOL initialized = NO;
    if(!initialized)
    {
        initialized = YES;
        _sharedSingleton = [[KBConfigurationManager alloc] init];
    }
}

+ (KBConfigurationManager *) sharedManager
{
    return _sharedSingleton;
}

#pragma mark -
#pragma mark ConfigObject

-(void)saveConfiguration
{
    [[NSUserDefaults standardUserDefaults] setObject:self.configuration forKey:kGameConfiguration];
}

-(void)readConfiguration
{
    self.configuration = [NSMutableDictionary dictionaryWithDictionary:[[NSUserDefaults standardUserDefaults] dictionaryForKey:kGameConfiguration]];
    
    if (self.configuration == nil) {
        self.configuration = [NSMutableDictionary dictionary];
    }
    
}

- (void)saveGameState
{
    
    self.configuration = [NSMutableDictionary dictionaryWithDictionary:[[NSUserDefaults standardUserDefaults] dictionaryForKey:kGameConfiguration]];
        
}

#pragma mark -
#pragma mark Convencience Methods

- (int)intForKey:(NSString*)key
{
    return [((NSNumber*)[self.configuration objectForKey:key]) integerValue];
}

- (double)doubleForKey:(NSString*)key
{
    return [((NSNumber*)[self.configuration objectForKey:key]) doubleValue];
}

- (void)setInt:(int)value forKey:(NSString*)key
{
    [self.configuration setValue:[NSNumber numberWithInt:value] forKey:key];
}

@end
