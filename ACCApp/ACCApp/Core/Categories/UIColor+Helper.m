//
//  UIColor+Helper.m
//  ACCApp
//
//  Created by Bin Yu on 26/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "UIColor+Helper.h"

@implementation UIColor (Helper)

+ (UIColor *)acc_colorFromHexString:(NSString *)hexString {
    if (hexString.length == 6) {
        unsigned rv = 0, gv = 0, bv = 0;
        [[NSScanner scannerWithString:[hexString substringWithRange:NSMakeRange(0, 2)]] scanHexInt:&rv];
        [[NSScanner scannerWithString:[hexString substringWithRange:NSMakeRange(2, 2)]] scanHexInt:&gv];
        [[NSScanner scannerWithString:[hexString substringWithRange:NSMakeRange(4, 2)]] scanHexInt:&bv];
        return [UIColor colorWithRed:rv/255.0f green:gv/255.0f blue:bv/255.0f alpha:1.0];
    }
    return nil;
}

@end
