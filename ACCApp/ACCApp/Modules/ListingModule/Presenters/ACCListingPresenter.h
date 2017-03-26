//
//  ACCListingPresenter.h
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IACCListingView;
@protocol IACCLocationService;
@protocol IACCHttpService;
@protocol IACCUserCacheService;
@protocol IACCListingRouter;

@interface ACCListingPresenter : NSObject

- (void)setView:(id<IACCListingView>)view;
- (void)setLocationService:(id<IACCLocationService>)locationService;
- (void)setHttpService:(id<IACCHttpService>)httpService;
- (void)setUserCacheService:(id<IACCUserCacheService>)userCacheService;
- (void)setRouter:(id<IACCListingRouter>)router;

@end
