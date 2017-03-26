//
//  ACCSettingsPresenter.h
//  ACCApp
//
//  Created by Bin Yu on 26/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IACCSettingsView;
@protocol IACCUserCacheService;

@interface ACCSettingsPresenter : NSObject

- (void)setView:(id<IACCSettingsView>)view;
- (void)setUserCacheService:(id<IACCUserCacheService>)userCacheService;

@end
