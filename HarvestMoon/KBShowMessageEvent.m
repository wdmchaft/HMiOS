//
//  KBTalkingEvent.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 27.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBShowMessageEvent.h"


@implementation KBShowMessageEvent

@synthesize text=_text;
@synthesize messageBox=_messageBox;
@synthesize hasFinishedRunning;
-(void)run
{
    self.messageBox = [KBMessageBox layerWithText:self.text];
    
    self.messageBox.delegate = self;
    
    [[[CCDirector sharedDirector] runningScene] addChild:self.messageBox];
    
}

-(void)messageBoxWillClose:(KBMessageBox *)messageBox 
{
    self.hasFinishedRunning = YES;
    
    
    [[[CCDirector sharedDirector] runningScene] removeChild:self.messageBox cleanup:YES];
}

-(id)initWithObject:(NSDictionary *)object
{
    self = [super init];
    if (self) {
        self.text = NSLocalizedString(@"SAMPLE TEXT", @"dunno");
    }
    return self;
}


@end
