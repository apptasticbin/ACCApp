//
//  ACCPhotoDataModel.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCPhotoDataModel.h"

static NSInteger  const kACCPhotoDataModelThumbnailWidth    = 100;
static NSInteger  const kACCPhotoDataModelThumbnailHeight   = 100;
static NSString * const kACCPhotoDataModelWHSizeFormat      = @"%@%@x%@%@";

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

- (NSString *)thumbnailUrlString {
    return [NSString stringWithFormat:kACCPhotoDataModelWHSizeFormat,
            self.prefix,
            @(kACCPhotoDataModelThumbnailWidth),
            @(kACCPhotoDataModelThumbnailHeight),
            self.suffix];
}

@end
