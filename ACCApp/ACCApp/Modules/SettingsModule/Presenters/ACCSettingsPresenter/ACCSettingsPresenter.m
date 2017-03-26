//
//  ACCSettingsPresenter.m
//  ACCApp
//
//  Created by Bin Yu on 26/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCSettingsPresenter.h"
#import "IACCSettingsPresenter.h"
#import "IACCSettingsView.h"
#import "IACCUserCacheService.h"

NSString * const kACCSettingsSearchRadiusKey    = @"kACCSettingsSearchRadiusKey";
NSString * const kACCSettingsSearchCategoryKey  = @"kACCSettingsSearchCategoryKey";

NSInteger const kACCSettingsSearchRadiusDefaultValue  = 500;
NSString * const kACCSettingsSearchCategoryDefaultValue = @"topPicks";


static NSString * const kACCSettingCategoryTopPicks     = @"topPicks";
static NSString * const kACCSettingCategoryFood         = @"food";
static NSString * const kACCSettingCategoryShops        = @"shops";
static NSString * const kACCSettingCategoryOutdoors     = @"ourdoors";

@interface ACCSettingsPresenter ()<IACCSettingsPresenter>

@property (nonatomic, weak) id<IACCSettingsView> view;
@property (nonatomic, strong) id<IACCUserCacheService> userCacheService;

@end

@implementation ACCSettingsPresenter

#pragma mark - IACCSettingsPresenter

// TODO: move this part into use cases
- (void)loadSearchRadiusValue {
    NSNumber *searchRadius = [self.userCacheService objectForKey:kACCSettingsSearchRadiusKey];
    [self.view searchRadiusDidUpdate:searchRadius];
}

- (void)loadSearchCategoryIndex {
    NSString *searchCategory = [self.userCacheService objectForKey:kACCSettingsSearchCategoryKey];
    [self.view searchCategoryIndexDidUpdate:[self categoryIndexFromString:searchCategory]];
}

- (void)updateSearchRadiusValue:(NSNumber *)newValue {
    [self.userCacheService setObject:newValue forKey:kACCSettingsSearchRadiusKey];
    [self.view searchRadiusDidUpdate:newValue];
}

- (void)updateSearchCategoryIndex:(NSUInteger)newCategoryIndex {
    [self.userCacheService setObject:[self stringFromCategoryIndex:newCategoryIndex]
                              forKey:kACCSettingsSearchCategoryKey];
    [self.view searchCategoryIndexDidUpdate:newCategoryIndex];
}

#pragma mark - Private

- (NSString *)stringFromCategoryIndex:(NSUInteger)index {
    return @[kACCSettingCategoryTopPicks,
             kACCSettingCategoryFood,
             kACCSettingCategoryShops,
             kACCSettingCategoryOutdoors][index];
}

- (NSUInteger)categoryIndexFromString:(NSString *)categoryString {
    return [@[kACCSettingCategoryTopPicks,
              kACCSettingCategoryFood,
              kACCSettingCategoryShops,
              kACCSettingCategoryOutdoors] indexOfObject:categoryString];
}

@end
