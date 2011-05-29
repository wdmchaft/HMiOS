//
//  KBMessageBoxDelegate.h
//  HarvestMoon
//
//  Created by Maurus Kühne on 27.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KBMessageBox;

@protocol KBMessageBoxDelegate <NSObject>
@required
-(void)messageBoxWillClose:(KBMessageBox *)messageBox;
@end
