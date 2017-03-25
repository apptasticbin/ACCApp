//
//  IACCLocationService.h
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

@class CLLocation;

typedef void(^IACCLoactionServiceDidUpdateLocationBlock)(NSString *, NSError *);

@protocol IACCLocationService <NSObject>

- (void)startUpdatingLocation:(IACCLoactionServiceDidUpdateLocationBlock)updateBlock;

@end
