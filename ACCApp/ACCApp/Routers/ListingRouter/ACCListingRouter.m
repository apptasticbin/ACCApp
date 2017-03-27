//
//  ACCListingRouter.m
//  ACCApp
//
//  Created by Bin Yu on 26/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCListingRouter.h"
#import "ACCSettingsPresenter.h"
#import "ACCSettingsViewController.h"
#import "ACCUserCacheService.h"
#import "UIStoryboard+Helper.h"

@implementation ACCListingRouter

- (void)presentSettingsModelFromViewController:(UIViewController *)viewController {
    ACCSettingsViewController *settingsViewController =
    [UIStoryboard acc_instantiateViewControllerWithId:@"ACCSettingsViewController"
                                         inStoryboard:@"Main"];
    ACCSettingsPresenter *settingsPresenter = [ACCSettingsPresenter new];
    
    [settingsViewController setPresenter:(id)settingsPresenter];
    [settingsPresenter setView:(id)settingsViewController];
    [settingsPresenter setUserCacheService:[ACCUserCacheService new]];
    
    [viewController.navigationController pushViewController:settingsViewController animated:YES];
}

@end
