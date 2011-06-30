//
//  KBItem.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 30.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBItem.h"

#define kName @"Name"
#define kSmallIcon @"SmallIcon"
#define kBigIcon @"BigIcon"
#define kType @"Type"

@implementation KBItem
@synthesize name = _name;
@synthesize smallSprite = _smallSprite;
@synthesize bigSprite = _bigSprite;
@synthesize itemType = _itemType;


-(id)initWithDefinitionFile:(NSString*)fileName
{
    self = [super init];
    if (self) {
        NSDictionary* dict = [KBPlistManager readPlistAsDictionary:fileName];
        
        self.name = [dict objectForKey:kName];
        
        self.smallSprite = [CCSprite spriteWithFile:[dict objectForKey:kSmallIcon]];
        self.bigSprite = [CCSprite spriteWithFile:[dict objectForKey:kBigIcon]];
        self.itemType = [[dict objectForKey:kType] isEqual:@"Tool"] ? Tool : Item;
        
        NSLog(@"created Item with parameters: %@", dict);
        
    }
    
    return self;
}
@end
