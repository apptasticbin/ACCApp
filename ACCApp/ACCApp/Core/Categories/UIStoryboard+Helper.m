//
//  UIStoryboard+Helper.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "UIStoryboard+Helper.h"

@implementation UIStoryboard (Helper)

+ (UIViewController *)instantiateViewControllerWithId:(NSString *)viewControllerId
                                         inStoryboard:(NSString *)storyboardName {
    UIStoryboard *storyboard = [self storyboardWithName:storyboardName
                                                 bundle:[NSBundle mainBundle]];
    return [storyboard instantiateViewControllerWithIdentifier:viewControllerId];
}

@end
