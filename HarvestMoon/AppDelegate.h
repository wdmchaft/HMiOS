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
#import "KBGameLayer.h"
#import "RootViewController.h"

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
    
	UIWindow* _window;
    
	RootViewController* _viewController;
    
}

#pragma mark -
#pragma mark Properties

@property (nonatomic, retain) UIWindow * window;

#pragma mark -
#pragma mark Init & Dealloc

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
