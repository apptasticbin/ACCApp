//
//  ACCListingPresenter.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCListingPresenter.h"
#import "IACCListingView.h"
#import "IACCListingPresenter.h"
#import "IACCLocationService.h"
#import "IACCHttpService.h"
#import "IACCUserCacheService.h"
#import "ACCVenueExploreDataModel.h"
#import "ACCVenueGroupDataModel.h"

static NSString * const kFourSquareVenuesExplorePath    = @"venues/explore";
static NSString * const kFourSquareLocationKey          = @"ll";
static NSString * const kFourSquareRadiusKey            = @"radius";
static NSString * const kFourSquareSectionKey           = @"section";
static NSString * const kFourSquareVenuePhotesKey       = @"venuePhotos";

static NSString * const kFourSquareVenuePhotos          = @"1";

@interface ACCListingPresenter ()<IACCListingPresenter>

@property (nonatomic, weak) id<IACCListingView> view;
@property (nonatomic, strong) id<IACCLocationService> locationService;
@property (nonatomic, strong) id<IACCHttpService> httpService;
@property (nonatomic, strong) id<IACCUserCacheService> userCacheService;

@property (nonatomic, strong) NSURLSessionDataTask *currentTask;

@end

@implementation ACCListingPresenter

#pragma mark - IACCListingPresenter

- (void)loadNearbyVenues {
    ACCListingPresenter * __weak weakSelf = self;
    [self.locationService startUpdatingLocation:^(NSString *location, NSError *error) {
        if (error) {
            NSLog(@"[ERROR] Failed to get current location");
            [self.view nearbyVenuesLoaded:nil];
        } else {
            [weakSelf p_fetchVenuesAtLocation:location
                                     complete:^(ACCVenueExploreDataModel *data, NSError *error) {
                                         if (data.groups && data.groups.count) {
                                             [weakSelf.view nearbyVenuesLoaded:data.groups[0].venues];
                                         } else {
                                             [weakSelf.view nearbyVenuesLoaded:nil];
                                         }
                                     }];
        }
    }];
}

#pragma mark - Private

// TODO: move this part into use cases
- (void)p_fetchVenuesAtLocation:(NSString *)location complete:(ACCBaseDataModelParseCompleteBlock)complete {
    ACCListingPresenter * __weak weakSelf = self;
    // cancel previous ongoing request
    if (weakSelf.currentTask) {
        [weakSelf.currentTask cancel];
        [self p_clearCurrentTask];
    }
    NSDictionary *parameters = @{
                                 kFourSquareLocationKey      :   location,
                                 kFourSquareSectionKey       :   [self.userCacheService objectForKey:kACCSettingsSearchCategoryKey],
                                 kFourSquareVenuePhotesKey   :   kFourSquareVenuePhotos,
                                 kFourSquareRadiusKey        :   [self.userCacheService objectForKey:kACCSettingsSearchRadiusKey]
                                 };
    // send new request
    weakSelf.currentTask =
    [weakSelf.httpService GET:kFourSquareVenuesExplorePath
                   parameters:parameters
                      success:^(NSURLSessionDataTask *task, id responseObject) {
                          [ACCVenueExploreDataModel parseDataAsync:responseObject
                                                          complete:^(ACCVenueExploreDataModel *data, NSError *error) {
                                                              if (complete) {
                                                                  complete(data, error);
                                                              }
                                                          }];
                          [weakSelf p_clearCurrentTask];
                      } failure:^(NSURLSessionDataTask *task, NSError *error) {
                          NSLog(@"[ERROR] Failed to fetch venues.");
                          [weakSelf p_clearCurrentTask];
                      }];
    [weakSelf.currentTask resume];
}

- (void)p_clearCurrentTask {
    self.currentTask = nil;
}

@end
