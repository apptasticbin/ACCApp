//
//  UIStoryboard+Helper.h
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (Helper)

+ (__kindof UIViewController *)instantiateViewControllerWithId:(NSString *)viewControllerId
                                                  inStoryboard:(NSString *)storyboardName;

@end
