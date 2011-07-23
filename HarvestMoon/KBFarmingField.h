//
//  KBFarmingField.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 28.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#pragma mark -
#pragma mark Interface

@interface KBFarmingField : CCNode{

#pragma mark -
#pragma mark Class Variables
    
    NSString* _spriteFile;
}

#pragma mark -
#pragma mark Propterties

@property(nonatomic,retain) NSString* spriteFile;

#pragma mark -
#pragma mark State Handling

-(NSDictionary*)dataRepresentation;

-(id)initWithDataRepresentation:(NSDictionary *)dataRepresentation;

#pragma mark -

@end
