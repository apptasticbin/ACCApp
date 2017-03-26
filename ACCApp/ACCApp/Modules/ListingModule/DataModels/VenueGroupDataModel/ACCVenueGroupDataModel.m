//
//  ACCVenueGroupDataModel.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCVenueGroupDataModel.h"
#import "ACCVenueDataModel.h"

@implementation ACCVenueGroupDataModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"venues" : @"items"
             };
}

+ (NSValueTransformer *)venuesJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[ACCVenueDataModel class]];
}

@end
