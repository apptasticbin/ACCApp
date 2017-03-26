//
//  ACCMainRouter.h
//  ACCApp
//
//  Created by Bin Yu on 26/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACCMainRouter.h"

@interface ACCMainRouter : NSObject<IACCMainRouter>

- (instancetype)initWithWindow:(UIWindow *)window;

@end
