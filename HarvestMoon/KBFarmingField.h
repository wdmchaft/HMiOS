//
//  KBFarmingField.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 28.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
@interface KBFarmingField : CCNode{
    NSString* _spriteFile;
}

@property(nonatomic,retain) NSString* spriteFile;
-(NSDictionary*)dataRepresentation;
-(id)initWithDataRepresentation:(NSDictionary *)dataRepresentation;
@end
