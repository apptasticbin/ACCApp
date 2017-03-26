//
//  ListingPresenter.h
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

@class UIViewController;

@protocol IACCListingPresenter <NSObject>

- (void)loadNearbyVenues;
- (void)presentSettingsFromViewController:(UIViewController *)viewController;

@end
