//
//  IACCUserCacheService.h
//  ACCApp
//
//  Created by Bin Yu on 26/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

@protocol IACCUserCacheService <NSObject>

- (id)objectForKey:(NSString *)defaultName;
- (void)setObject:(id)value forKey:(NSString *)defaultName;

@end
