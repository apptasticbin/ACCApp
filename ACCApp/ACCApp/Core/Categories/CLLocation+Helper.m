//
//  CLLocation+Helper.m
//  ACCApp
//
//  Created by Bin Yu on 26/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "CLLocation+Helper.h"

@implementation CLLocation (Helper)

- (NSString *)acc_stringValue {
    CLLocationCoordinate2D locationCoordinate = self.coordinate;
    return [NSString stringWithFormat:@"%@,%@",
            @(locationCoordinate.latitude),
            @(locationCoordinate.longitude)];
}

@end
