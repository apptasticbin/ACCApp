//
//  ACCSettingsViewController.h
//  ACCApp
//
//  Created by Bin Yu on 26/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IACCSettingsPresenter;

@interface ACCSettingsViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *searchRadiusLabel;
@property (weak, nonatomic) IBOutlet UIStepper *searchRadiusStepper;
@property (weak, nonatomic) IBOutlet UISegmentedControl *searchCategorySegmentedControl;

- (void)setPresenter:(id<IACCSettingsPresenter>)presenter;

@end
