//
//  KBMessageBox.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 27.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBMessageBox.h"


@implementation KBMessageBox

@synthesize text=_text;
@synthesize sprite=_sprite;
@synthesize delegate=_delegate;
@synthesize label=_label;

+ (KBMessageBox *) layerWithText:(NSString *)text
{
	
	// 'layer' is an autorelease object.
	KBMessageBox *layer = [[KBMessageBox alloc] initWithText:text];
	
	return layer;
}

- (void) registerWithTouchDispatcher
{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

- (id)initWithText:(NSString*)text {
    self = [super init];
    if (self) {
        self.text=text;
        
        self.sprite = [CCSprite spriteWithFile:@"message_background.png"];
        
        [self.sprite setPosition:ccp([[CCDirector sharedDirector] winSize].width/2, 50)];
        
        
        self.label = [CCLabelTTF labelWithString:text dimensions:CGSizeMake([[CCDirector sharedDirector] winSize].width - 20, 210) 
                                       alignment:UITextAlignmentLeft 
                                        fontName:@"Marker Felt" fontSize:16];
        
        //self.label = [CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:16 ];
        [self.label setColor:ccBLACK];
        
        
        
        self.label.position = ccp([[CCDirector sharedDirector] winSize].width/2, 10);
        
        [self addChild:self.sprite];
        [self addChild:self.label];
        
        [self setIsTouchEnabled:YES];
        
    }
    return self;
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    [self ccTouchEnded:touch withEvent:event];
    
    return YES;
}


-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    [self.delegate messageBoxWillClose:self];
    
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    
    
    [self removeChild:self.sprite cleanup:YES];
    [self removeChild:self.label cleanup:YES];
}

@end
