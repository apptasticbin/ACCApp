//
//  ACCListingPresenter.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCListingPresenter.h"
#import "IACCListingView.h"
#import "IACCListingPresenter.h"

@interface ACCListingPresenter ()<IACCListingPresenter>

@property (nonatomic, weak) id<IACCListingView> view;

@end

@implementation ACCListingPresenter

@end
