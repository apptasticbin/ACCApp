//
//  ACCListingViewController.h
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IACCListingPresenter;

@interface ACCListingViewController : NSObject

- (instancetype)initWithPresenter:(id<IACCListingPresenter>)presenter;

@end
