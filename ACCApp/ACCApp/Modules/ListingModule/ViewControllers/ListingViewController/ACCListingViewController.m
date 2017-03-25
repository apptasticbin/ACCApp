//
//  ACCListingViewController.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCListingViewController.h"
#import "IACCListingPresenter.h"
#import "IACCListingView.h"

@interface ACCListingViewController ()<IACCListingView>

@property (nonatomic, strong) id<IACCListingPresenter> presenter;

@end

@implementation ACCListingViewController

- (instancetype)initWithPresenter:(id<IACCListingPresenter>)presenter {
    self = [super init];
    if (self) {
        _presenter = presenter;
    }
    return self;
}

@end
