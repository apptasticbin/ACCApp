//
//  ACCVenueExploreDataModel.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCVenueExploreDataModel.h"
#import "ACCVenueGroupDataModel.h"

@implementation ACCVenueExploreDataModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"groups" : @"response.groups"
             };
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[ACCVenueGroupDataModel class]];
}

@end
