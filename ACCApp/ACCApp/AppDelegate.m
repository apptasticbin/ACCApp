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
#import "UIStoryboard+Helper.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [self createMainViewController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (ACCMainViewController *)createMainViewController {
    ACCListingViewController *listingViewController = [self createListingViewController];
    return [[ACCMainViewController alloc] initWithRootViewController:listingViewController];
}

- (ACCListingViewController *)createListingViewController {
    ACCListingPresenter *listingPresenter = [ACCListingPresenter new];
    ACCListingViewController *listingViewController =
    [UIStoryboard instantiateViewControllerWithId:@"ACCListingViewController"
                                     inStoryboard:@"Main"];
    
    [listingPresenter setView:(id)listingViewController];
    [listingViewController setPresenter:(id)listingPresenter];
    
    return listingViewController;
}

@end
