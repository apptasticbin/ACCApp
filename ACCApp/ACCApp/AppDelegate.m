//
//  AppDelegate.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "AppDelegate.h"
#import "ACCAppearanceController.h"
#import "ACCMainRouter.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self p_setupWindow];
    [self p_setupAppearance];
    [self p_presentMainModel];
    return YES;
}

- (void)p_setupWindow {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
}

- (void)p_setupAppearance {
    [ACCAppearanceController setupApplicationAppearance];
}

- (void)p_presentMainModel {
    [[[ACCMainRouter alloc] initWithWindow:self.window] presentMainModel];
}

@end
