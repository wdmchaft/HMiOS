//
//  KBMessageBox.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 27.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameConfig.h"
#import "KBMessageBoxDelegate.h"

#pragma mark -
#pragma mark Interface

@interface KBMessageBox : CCLayer {

#pragma mark -
#pragma mark Class Variables
    
    NSString* _text;
    
    CCSprite* _sprite;
    
    CCLabelTTF* _label;
    
    id<KBMessageBoxDelegate> _delegate;

}

#pragma mark -
#pragma mark Properties

@property(nonatomic,retain) id<KBMessageBoxDelegate> delegate;

@property(nonatomic,retain) NSString* text;

@property(nonatomic,retain) CCSprite* sprite;

@property(nonatomic,retain) CCLabelTTF* label;

#pragma mark -
#pragma mark State Handling

+ (KBMessageBox *) layerWithText:(NSString *)text;

- (id)initWithText:(NSString*)text;

#pragma mark -
#pragma mark Touch Handling

-(void)registerWithTouchDispatcher;

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event;

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event;

#pragma mark -

@end
