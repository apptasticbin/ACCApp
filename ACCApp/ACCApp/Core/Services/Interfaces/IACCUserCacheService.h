//
//  IACCUserCacheService.h
//  ACCApp
//
//  Created by Bin Yu on 26/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

FOUNDATION_EXPORT NSString * const kACCSettingsSearchRadiusKey;
FOUNDATION_EXPORT NSString * const kACCSettingsSearchCategoryKey;

FOUNDATION_EXPORT NSInteger const kACCSettingsSearchRadiusDefaultValue;
FOUNDATION_EXPORT NSString * const kACCSettingsSearchCategoryDefaultValue;

@protocol IACCUserCacheService <NSObject>

- (id)objectForKey:(NSString *)defaultName;
- (void)setObject:(id)value forKey:(NSString *)defaultName;

@end
