//
//  ACCUserCacheService.m
//  ACCApp
//
//  Created by Bin Yu on 26/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCUserCacheService.h"

@interface ACCUserCacheService ()

@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

@implementation ACCUserCacheService

- (instancetype)init
{
    self = [super init];
    if (self) {
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

#pragma mark - IACCUserCacheService

- (id)objectForKey:(NSString *)defaultName {
    id value = [self.userDefaults objectForKey:defaultName];
    if (!value) {
        value = [self defaultObjectForKey:defaultName];
    }
    return value;
}

- (void)setObject:(id)value forKey:(NSString *)defaultName {
    [self.userDefaults setObject:value forKey:defaultName];
    [self.userDefaults synchronize];
}

#pragma mark - Private

- (id)defaultObjectForKey:(NSString *)key {
    return @{
             kACCSettingsSearchRadiusKey    :   @(kACCSettingsSearchRadiusDefaultValue),
             kACCSettingsSearchCategoryKey  :   kACCSettingsSearchCategoryDefaultValue
             }[key];
}

@end
