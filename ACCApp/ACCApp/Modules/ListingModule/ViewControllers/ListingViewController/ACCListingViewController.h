//
//  ACCListingViewController.h
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IACCListingPresenter;

@interface ACCListingViewController : UITableViewController

- (void)setPresenter:(id<IACCListingPresenter>)presenter;

@end
