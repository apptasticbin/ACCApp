//
//  IACCListingView.h
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

@class ACCVenueDataModel;

@protocol IACCListingView <NSObject>

- (void)nearbyVenuesLoaded:(NSArray<ACCVenueDataModel *> *)venues;

@end
