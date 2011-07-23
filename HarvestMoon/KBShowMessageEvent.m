//
//  KBTalkingEvent.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 27.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBShowMessageEvent.h"


#pragma mark -
#pragma mark Implementation

@implementation KBShowMessageEvent

#pragma mark -
#pragma mark Properties

@synthesize text=_text;

@synthesize messageBox=_messageBox;

@synthesize hasFinishedRunning;

#pragma mark -
#pragma mark State Handling

-(id)initWithObject:(NSDictionary *)object
{
    self = [super init];
    if (self) {
        self.text = NSLocalizedString([object valueForKey:kMessageText], @"Text from KBShowMessageEvent");
        
        if (self.text == nil) {
            self.text = NSLocalizedString([object valueForKey:@"SAMPLE_TEXT"], @"Text from KBShowMessageEvent");
        }
        
    }
    return self;
}

#pragma mark -
#pragma mark Event Handling

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

-(RunOnEvent) runsOnEvent
{
    return TouchedWithFinger;
}

#pragma mark -

@end
