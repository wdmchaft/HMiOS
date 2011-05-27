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

@interface KBMessageBox : CCLayer {
    NSString* _text;
    CCSprite* _sprite;
    CCLabelTTF* _label;
    
    id<KBMessageBoxDelegate> _delegate;
}

@property(nonatomic,retain) id<KBMessageBoxDelegate> delegate;
@property(nonatomic,retain) NSString* text;
@property(nonatomic,retain) CCSprite* sprite;
@property(nonatomic,retain) CCLabelTTF* label;

+ (KBMessageBox *) layerWithText:(NSString *)text;
- (id)initWithText:(NSString*)text;
@end
