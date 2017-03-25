//
//  ACCAppearanceController.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCAppearanceController.h"

@implementation ACCAppearanceController

+ (void)setupApplicationAppearance {
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0 green:0.2 blue:0.6 alpha:1.0]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}

@end
