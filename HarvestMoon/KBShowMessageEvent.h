//
//  KBTalkingEvent.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 27.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KBEvent.h"
#import "cocos2d.h"
#import "KBMessageBox.h"
#import "KBStandardGameController.h"
#import "KBMessageBoxDelegate.h"
#import "ScriptingIdentifiers.h"

#pragma mark -
#pragma mark Interface

@interface KBShowMessageEvent : NSObject <KBEvent,KBMessageBoxDelegate> {
    
#pragma mark -
#pragma mark Class Variables
    
    NSString* _text;

    KBMessageBox* _messageBox;

}

#pragma mark -
#pragma mark Properties

@property(nonatomic,retain) NSString* text;

@property(nonatomic,retain) KBMessageBox* messageBox;

#pragma mark -
#pragma mark State Handling

-(id)initWithObject:(NSDictionary *)object;

#pragma mark -
#pragma mark Event Handling

-(void)run;

-(void)messageBoxWillClose:(KBMessageBox *)messageBox;

-(RunOnEvent) runsOnEvent;

#pragma mark -

@end
