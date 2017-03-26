//
//  LocationService.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCLocationService.h"
#import "CLLocation+Helper.h"
#import <CoreLocation/CoreLocation.h>

NSString * const ACCLocationServiceErrorDomain = @"service.location.accapp";

@interface ACCLocationService ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, copy) IACCLoactionServiceDidUpdateLocationBlock updateBlock;

@end

@implementation ACCLocationService

- (instancetype)init
{
    self = [super init];
    if (self) {
        _locationManager = [CLLocationManager new];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    }
    return self;
}

- (void)startUpdatingLocation:(IACCLoactionServiceDidUpdateLocationBlock)updateBlock {
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager stopUpdatingLocation];
    self.updateBlock = updateBlock;
    [self.locationManager startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation* location = [locations lastObject];
    if (self.updateBlock) {
        self.updateBlock([location stringValue], nil);
        self.updateBlock = nil;
    }
    [self.locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusDenied || status == kCLAuthorizationStatusRestricted) {
        if (self.updateBlock) {
            NSError *error = [NSError errorWithDomain:ACCLocationServiceErrorDomain
                                                 code:ACCLocationServiceErrorDenied
                                             userInfo:nil];
            self.updateBlock(nil, error);
            self.updateBlock = nil;
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if (self.updateBlock) {
        self.updateBlock(nil, error);
        self.updateBlock = nil;
    }
    [self.locationManager stopUpdatingLocation];
}

@end
