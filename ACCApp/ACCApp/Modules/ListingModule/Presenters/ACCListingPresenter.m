//
//  ACCListingPresenter.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCListingPresenter.h"
#import "ACCSettingsConfiguration.h"
#import "ACCSiteConfiguration.h"
#import "ACCVenueExploreDataModel.h"
#import "ACCVenueGroupDataModel.h"
#import "IACCListingView.h"
#import "IACCListingPresenter.h"
#import "IACCListingRouter.h"
#import "IACCLocationService.h"
#import "IACCHttpService.h"
#import "IACCUserCacheService.h"

@interface ACCListingPresenter ()<IACCListingPresenter>

@property (nonatomic, weak) id<IACCListingView> view;
@property (nonatomic, strong) id<IACCLocationService> locationService;
@property (nonatomic, strong) id<IACCHttpService> httpService;
@property (nonatomic, strong) id<IACCUserCacheService> userCacheService;
@property (nonatomic, strong) id<IACCListingRouter> router;

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
            return;
        }
        
        id completeBlock = ^(ACCVenueExploreDataModel *data, NSError *error) {
            if (data.groups && data.groups.count) {
                [weakSelf.view nearbyVenuesLoaded:data.groups[0].venues];
            } else {
                [weakSelf.view nearbyVenuesLoaded:nil];
            }
        };
        
        [weakSelf p_fetchVenuesAtLocation:location complete:completeBlock];
    }];
}

- (void)presentSettingsFromViewController:(UIViewController *)viewController {
    [self.router presentSettingsModelFromViewController:viewController];
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
    
    NSString *section = [self.userCacheService objectForKey:ACCSettingsSearchCategoryKey];
    NSNumber *radius = [self.userCacheService objectForKey:ACCSettingsSearchRadiusKey];
    NSDictionary *parameters = @{
                                 ACCFourSquareLocationKey      :   location,
                                 ACCFourSquareSectionKey       :   section,
                                 ACCFourSquareVenuePhotesKey   :   ACCFourSquareVenuePhotos,
                                 ACCFourSquareRadiusKey        :   radius
                                 };
    // send new request
    weakSelf.currentTask = [self p_createFetchVenuesTaskWittParameters:parameters complete:complete];
    [weakSelf.currentTask resume];
}

- (NSURLSessionDataTask *)p_createFetchVenuesTaskWittParameters:(NSDictionary *)parameters
                                                       complete:(ACCBaseDataModelParseCompleteBlock)complete {
    ACCListingPresenter * __weak weakSelf = self;
    
    id successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        [ACCVenueExploreDataModel parseDataAsync:responseObject
                                        complete:^(ACCVenueExploreDataModel *data, NSError *error) {
                                            if (complete) {
                                                complete(data, error);
                                            }
                                        }];
        [weakSelf p_clearCurrentTask];
    };
    
    id failureBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"[ERROR] Failed to fetch venues.");
        if (complete) {
            complete(nil, error);
        }
        [weakSelf p_clearCurrentTask];
    };
    
    return [weakSelf.httpService GET:ACCFourSquareVenuesExplorePath
                          parameters:parameters
                             success:successBlock
                             failure:failureBlock];
}

- (void)p_clearCurrentTask {
    self.currentTask = nil;
}

@end
