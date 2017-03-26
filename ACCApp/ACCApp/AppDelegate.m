//
//  AppDelegate.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "AppDelegate.h"
#import "ACCMainViewController.h"
#import "ACCListingViewController.h"
#import "ACCListingPresenter.h"
#import "ACCLocationService.h"
#import "ACCHttpService.h"
#import "ACCUserCacheService.h"
#import "ACCAppearanceController.h"
#import "UIStoryboard+Helper.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self p_setupWindow];
    [self p_setupAppearance];
    return YES;
}

- (void)p_setupWindow {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [self p_createMainViewController];
    [self.window makeKeyAndVisible];
}

- (void)p_setupAppearance {
    [ACCAppearanceController setupApplicationAppearance];
}

// TODO: move these codes into router
- (ACCMainViewController *)p_createMainViewController {
    ACCListingViewController *listingViewController = [self p_createListingViewController];
    return [[ACCMainViewController alloc] initWithRootViewController:listingViewController];
}

- (ACCListingViewController *)p_createListingViewController {
    ACCListingPresenter *listingPresenter = [ACCListingPresenter new];
    ACCListingViewController *listingViewController =
    [UIStoryboard instantiateViewControllerWithId:@"ACCListingViewController"
                                     inStoryboard:@"Main"];
    
    [listingPresenter setView:(id)listingViewController];
    [listingPresenter setLocationService:(id)[ACCLocationService new]];
    [listingPresenter setHttpService:[ACCHttpService new]];
    [listingPresenter setUserCacheService:[ACCUserCacheService new]];
    
    [listingViewController setPresenter:(id)listingPresenter];
    return listingViewController;
}

@end
