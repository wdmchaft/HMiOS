//
//  AppDelegate.h
//  HarvestMoon
//
//  Created by Maurus KŸhne on 14.05.11.
//  Copyright KBDevers 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "GameConfig.h"
#import "RootViewController.h"
#import "KBMasterController.h"

#pragma mark -
#pragma mark Forward Declarations

@class RootViewController;

#pragma mark -
#pragma mark Interface

@interface AppDelegate : NSObject <UIApplicationDelegate> {
    
#pragma mark -
#pragma mark Class Variables
    
	UIWindow* _window;
    
	RootViewController* _viewController;
    
}

#pragma mark -
#pragma mark Properties

@property (nonatomic, retain) UIWindow * window;

#pragma mark -
#pragma mark State Handling

- (void) dealloc;

#pragma mark -
#pragma mark Cocos2D Methods

- (void) removeStartupFlicker;

#pragma mark -
#pragma mark UIApplicationDelegate Methods

- (void) applicationDidFinishLaunching:(UIApplication*) application;

- (void) applicationWillResignActive:(UIApplication *) application;

- (void) applicationDidBecomeActive:(UIApplication *) application;

- (void) applicationDidReceiveMemoryWarning:(UIApplication *) application;

- (void) applicationDidEnterBackground:(UIApplication *) application;

- (void) applicationWillEnterForeground:(UIApplication *) application;

- (void) applicationWillTerminate:(UIApplication *) application;

- (void) applicationSignificantTimeChange:(UIApplication *) application;

#pragma mark -

@end
