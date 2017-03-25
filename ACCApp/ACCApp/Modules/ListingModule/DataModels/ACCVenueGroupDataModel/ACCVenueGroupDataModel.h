//
//  ACCVenueGroupDataModel.h
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCBaseDataModel.h"

@class ACCVenueDataModel;

@interface ACCVenueGroupDataModel : ACCBaseDataModel<MTLJSONSerializing>

@property (nonatomic, strong) NSArray<ACCVenueDataModel *> *venues;

@end
