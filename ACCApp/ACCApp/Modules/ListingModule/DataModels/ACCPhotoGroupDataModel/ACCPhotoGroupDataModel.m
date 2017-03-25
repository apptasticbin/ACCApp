//
//  ACCPhotoGroupDataModel.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCPhotoGroupDataModel.h"
#import "ACCPhotoDataModel.h"

@implementation ACCPhotoGroupDataModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"photos"  :   @"items"
             };
}

+ (NSValueTransformer *)photosJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[ACCPhotoDataModel class]];
}

@end
