//
//  ACCSettingsPresenter.m
//  ACCApp
//
//  Created by Bin Yu on 26/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCSettingsPresenter.h"
#import "ACCSettingsConfiguration.h"
#import "IACCSettingsPresenter.h"
#import "IACCSettingsView.h"
#import "IACCUserCacheService.h"

@interface ACCSettingsPresenter ()<IACCSettingsPresenter>

@property (nonatomic, weak) id<IACCSettingsView> view;
@property (nonatomic, strong) id<IACCUserCacheService> userCacheService;

@end

@implementation ACCSettingsPresenter

#pragma mark - IACCSettingsPresenter

// TODO: move this part into use cases
- (void)loadSearchRadiusValue {
    NSNumber *searchRadius = [self.userCacheService objectForKey:ACCSettingsSearchRadiusKey];
    [self.view searchRadiusDidUpdate:searchRadius];
}

- (void)loadSearchCategoryIndex {
    NSString *searchCategory = [self.userCacheService objectForKey:ACCSettingsSearchCategoryKey];
    [self.view searchCategoryIndexDidUpdate:[self p_categoryIndexFromString:searchCategory]];
}

- (void)updateSearchRadiusValue:(NSNumber *)newValue {
    [self.userCacheService setObject:newValue forKey:ACCSettingsSearchRadiusKey];
    [self.view searchRadiusDidUpdate:newValue];
}

- (void)updateSearchCategoryIndex:(NSUInteger)newCategoryIndex {
    [self.userCacheService setObject:[self p_stringFromCategoryIndex:newCategoryIndex]
                              forKey:ACCSettingsSearchCategoryKey];
    [self.view searchCategoryIndexDidUpdate:newCategoryIndex];
}

#pragma mark - Private

- (NSString *)p_stringFromCategoryIndex:(NSUInteger)index {
    return @[ACCSettingCategoryTopPicks,
             ACCSettingCategoryFood,
             ACCSettingCategoryShops,
             ACCSettingCategoryOutdoors][index];
}

- (NSUInteger)p_categoryIndexFromString:(NSString *)categoryString {
    return [@[ACCSettingCategoryTopPicks,
              ACCSettingCategoryFood,
              ACCSettingCategoryShops,
              ACCSettingCategoryOutdoors] indexOfObject:categoryString];
}

@end
