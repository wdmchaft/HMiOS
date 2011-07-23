//
//  KBItem.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 30.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBItem.h"

#pragma mark -
#pragma mark ConfigurationKeys

#define kName @"Name"

#define kSmallIcon @"SmallIcon"

#define kBigIcon @"BigIcon"

#define kType @"Type"

#define kFileNameKey @"fileName"

#pragma mark -
#pragma mark Implementation

@implementation KBItem

#pragma mark -
#pragma mark Properties

@synthesize name = _name;

@synthesize smallSprite = _smallSprite;

@synthesize bigSprite = _bigSprite;

@synthesize itemType = _itemType;

@synthesize fileName = _fileName;

#pragma mark -
#pragma mark State Handling

-(id)initWithDefinitionFile:(NSString*)fileName
{
    self = [super init];
    if (self) {
        NSDictionary* dict = [KBPlistManager readPlistFromBundleAsDictionary:fileName];
        
        self.name = [dict objectForKey:kName];
        
        self.smallSprite = [CCSprite spriteWithFile:[dict objectForKey:kSmallIcon]];
        self.bigSprite = [CCSprite spriteWithFile:[dict objectForKey:kBigIcon]];
        self.itemType = [[dict objectForKey:kType] isEqual:@"Tool"] ? Tool : Item;
        
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    return [self initWithDefinitionFile:[aDecoder decodeObjectForKey:kFileNameKey]];
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.fileName forKey:kFileNameKey];
}

#pragma mark -

@end
