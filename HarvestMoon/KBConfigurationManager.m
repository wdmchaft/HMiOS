//
//  KBConfigurationManager.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 12.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBConfigurationManager.h"
#import "KBPlistManager.h"

@implementation KBConfigurationManager

@synthesize configuration = _configuration;

static KBConfigurationManager* _sharedSingleton;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        
        self.configuration = [NSMutableDictionary dictionary];
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

- (NSUInteger)uIntForKey:(NSString*)key
{
    return [((NSNumber*)[self.configuration objectForKey:key]) unsignedIntegerValue];
}

- (void)setUInt:(NSUInteger)value forKey:(NSString*)key
{
    [self.configuration setValue:[NSNumber numberWithUnsignedInteger:value] 
                          forKey:key];
}

- (int)intForKey:(NSString*)key
{
    return [((NSNumber*)[self.configuration objectForKey:key]) integerValue];
}

- (double)doubleForKey:(NSString*)key
{
    return [((NSNumber*)[self.configuration objectForKey:key]) doubleValue];
}

- (NSString*)stringForKey:(NSString*)key
{
    return (NSString*)[self.configuration objectForKey:key];
}

- (void)setInt:(int)value forKey:(NSString*)key
{
    [self.configuration setValue:[NSNumber numberWithInt:value] forKey:key];
}


-(CGPoint)pointForKey:(NSString*)key
{
    return CGPointFromString((NSString*)[self.configuration valueForKey:key]);
}
-(void)setPoint:(CGPoint)point forKey:(NSString*)key
{
    [self.configuration setValue:NSStringFromCGPoint(point) forKey:key];
}

-(CGSize)sizeForKey:(NSString*)key
{
    return CGSizeFromString((NSString*)[self.configuration valueForKey:key]);
}
-(void)setSize:(CGSize)size forKey:(NSString*)key
{
    [self.configuration setValue:NSStringFromCGSize(size) forKey:key];
}

-(NSString*)documentsPathForFile:(NSString*)fileName
{
    NSString* documentsPath =[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];  
    
    NSAssert(documentsPath != nil, @"Documents Folder not found!");
    
    return [documentsPath stringByAppendingPathComponent:fileName];
}

-(void)saveValue:(id<NSCoding>)value intoFile:(NSString*)fileName
{
    if (value == nil) {
        NSLog(@"value was nil, didn't save anything...");
        return;
    }
    
    NSLog(@"write to File %@",fileName);
    
    NSString* documentsPath =[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];  
    
    NSAssert(documentsPath != nil, @"Documents Folder not found!");
    
    NSString* filePath = [documentsPath stringByAppendingPathComponent:fileName];
    
    [KBPlistManager writePlist:value toFile:filePath];
    
    //[KBPlistManager writePlist:filePath withDictionary:((NSDictionary*) value)];
}

-(id)loadValueFromFile:(NSString*)fileName
{
    NSLog(@"loading from File %@", fileName);
      
    NSString* documentsPath =[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];  
    
    NSAssert(documentsPath != nil, @"Documents Folder not found!");
    
    NSString* filePath = [documentsPath stringByAppendingPathComponent:fileName];
    
    return [KBPlistManager readPlistFromPath:filePath];
    
    //return [KBPlistManager readPlistAsDictionary:filePath];
}

@end
