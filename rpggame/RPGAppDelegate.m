//
//  RPGAppDelegate.m
//  rpggame
//
//  Created by Ellis Gray on 3/01/2015.
//  Copyright (c) 2015 Ellis Gray. All rights reserved.
//

#import "RPGAppDelegate.h"
#import "RPGGame.h"

@implementation RPGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _viewController = [[SPViewController alloc] init];
    [_viewController startWithRoot:[RPGGame class] supportHighResolutions:YES doubleOnPad:YES];
    _viewController.multitouchEnabled = YES;
    _viewController.preferredFramesPerSecond = 60;
    
    [_window setRootViewController:_viewController];
    [_window makeKeyAndVisible];
    return YES;
    
}


@end
