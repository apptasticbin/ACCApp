//
//  ACCPhotoDataModel.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCPhotoDataModel.h"

@implementation ACCPhotoDataModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"prefix"  :   @"prefix",
             @"suffix"  :   @"suffix",
             @"width"   :   @"width",
             @"height"  :   @"height"
             };
}

#pragma mark - Public

- (NSString *)fullUrlString {
    return [NSString stringWithFormat:@"%@%@x%@%@", self.prefix, self.width, self.height, self.suffix];
}

@end
