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

@interface KBShowMessageEvent : NSObject <KBEvent,KBMessageBoxDelegate> {
    NSString* _text;
    KBMessageBox* _messageBox;
}

@property(nonatomic,retain) NSString* text;
@property(nonatomic,retain) KBMessageBox* messageBox;

@end
