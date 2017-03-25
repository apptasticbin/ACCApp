//
//  ACCVenueDataModel.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCVenueDataModel.h"
#import "ACCPhotoGroupDataModel.h"
#import "ACCPhotoDataModel.h"

@implementation ACCVenueDataModel

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name"        :   @"venue.name",
             @"distance"    :   @"venue.location.distance",
             @"rating"      :   @"venue.rating",
             @"ratingColor" :   @"venue.ratingColor",
             @"photoGroups" :   @"venue.photos.groups"
             };
}

+ (NSValueTransformer *)photoGroupsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[ACCPhotoGroupDataModel class]];
}

- (NSString *)venuePhotoURLString {
    if (self.photoGroups && self.photoGroups.count) {
        ACCPhotoGroupDataModel *photoGroup = self.photoGroups.firstObject;
        if (photoGroup.photos && photoGroup.photos.count) {
            return photoGroup.photos.firstObject.fullUrlString;
        }
    }
    return nil;
}

@end
