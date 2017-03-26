//
//  ACCVenueDataModel.h
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ACCBaseDataModel.h"

@class ACCPhotoGroupDataModel;

@interface ACCVenueDataModel : ACCBaseDataModel<MTLJSONSerializing>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *distance;
@property (nonatomic, strong) NSNumber *rating;
@property (nonatomic, strong) NSString *ratingColor;
@property (nonatomic, strong) NSArray<ACCPhotoGroupDataModel *> *photoGroups;

- (NSString *)venuePhotoURLString;

@end
