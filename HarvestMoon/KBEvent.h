//
//  KBScript.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 24.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol KBEvent <NSObject>
@required
@property(nonatomic) BOOL hasFinishedRunning;

-(void) run;
-(id)initWithObject:(NSDictionary *)object;
@end
