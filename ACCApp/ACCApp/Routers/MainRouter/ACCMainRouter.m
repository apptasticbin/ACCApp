//
//  ACCMainRouter.m
//  ACCApp
//
//  Created by Bin Yu on 26/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCMainRouter.h"
#import "ACCMainViewController.h"
#import "ACCListingViewController.h"
#import "ACCListingPresenter.h"
#import "ACCListingRouter.h"
#import "ACCLocationService.h"
#import "ACCHttpService.h"
#import "ACCUserCacheService.h"
#import "UIStoryboard+Helper.h"

@interface ACCMainRouter ()

@property (nonatomic, strong) UIWindow *window;

@end

@implementation ACCMainRouter

- (instancetype)initWithWindow:(UIWindow *)window {
    self = [super init];
    if (self) {
        _window = window;
    }
    return self;
}

#pragma mark - IACCMainRouter

- (void)presentMainModel {
    self.window.rootViewController = [self p_createMainViewController];
}

#pragma mark - Private

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
    [listingPresenter setRouter:[ACCListingRouter new]];
    
    [listingViewController setPresenter:(id)listingPresenter];
    return listingViewController;
}


@end
