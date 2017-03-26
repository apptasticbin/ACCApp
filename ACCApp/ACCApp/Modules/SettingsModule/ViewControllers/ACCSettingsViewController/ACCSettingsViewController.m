//
//  ACCSettingsViewController.m
//  ACCApp
//
//  Created by Bin Yu on 26/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCSettingsViewController.h"
#import "IACCSettingsPresenter.h"
#import "IACCSettingsView.h"

static NSUInteger const kACCSettingsSearchRadiusMinValue = 200;
static NSUInteger const kACCSettingsSearchRadiusMaxValue = 1000;
static NSUInteger const kACCSettingsSearchRadiusStep = 100;

@interface ACCSettingsViewController ()<IACCSettingsView>

@property (nonatomic, strong) id<IACCSettingsPresenter> presenter;

@end

@implementation ACCSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupSearchRadiusControls];
    [self p_setupSearchCategorySegementedControl];
    [self p_loadSearchRadiusSetting];
    [self p_loadSearchCategorySetting];
}

#pragma mark - IACCSettingsView

- (void)searchRadiusDidUpdate:(NSNumber *)newValue {
    self.searchRadiusLabel.text = [NSString stringWithFormat:@"%@ meters", newValue];
    if (self.searchRadiusStepper.value != newValue.doubleValue) {
        self.searchRadiusStepper.value = newValue.doubleValue;
    }
}

- (void)searchCategoryIndexDidUpdate:(NSInteger)newIndex {
    if (self.searchCategorySegmentedControl.selectedSegmentIndex != newIndex) {
        self.searchCategorySegmentedControl.selectedSegmentIndex = newIndex;
    }
}

#pragma mark - Private

- (void)p_setupSearchRadiusControls {
    self.searchRadiusStepper.minimumValue = kACCSettingsSearchRadiusMinValue;
    self.searchRadiusStepper.maximumValue = kACCSettingsSearchRadiusMaxValue;
    self.searchRadiusStepper.stepValue = kACCSettingsSearchRadiusStep;
    [self.searchRadiusStepper addTarget:self
                                 action:@selector(p_searchRadiusValueChanged:)
                       forControlEvents:UIControlEventValueChanged];
}

- (void)p_setupSearchCategorySegementedControl {
    [self.searchCategorySegmentedControl addTarget:self
                                            action:@selector(p_searchCategoryValueChanged:)
                                  forControlEvents:UIControlEventValueChanged];
}

- (void)p_loadSearchRadiusSetting {
    [self.presenter loadSearchRadiusValue];
}

- (void)p_loadSearchCategorySetting {
    [self.presenter loadSearchCategoryIndex];
}

- (void)p_searchRadiusValueChanged:(UIStepper *)sender {
    [self.presenter updateSearchRadiusValue:@(sender.value)];
}

- (void)p_searchCategoryValueChanged:(UISegmentedControl *)sender {
    [self.presenter updateSearchCategoryIndex:sender.selectedSegmentIndex];
}

@end
