//
//  RootViewController.h
//  HarvestMoon
//
//  Created by Maurus K�hne on 14.05.11.
//  Copyright KBDevers 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "GameConfig.h"

#pragma mark -
#pragma mark Interface

@interface RootViewController : UIViewController {

}

#pragma mark -
#pragma mark State Handling

- (void) dealloc;

#pragma mark -
#pragma mark UIViewController Methods

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation;

- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation) toInterfaceOrientation 
                               duration:(NSTimeInterval) duration;

- (void) didReceiveMemoryWarning;

- (void) viewDidUnload;

#pragma mark -

@end
