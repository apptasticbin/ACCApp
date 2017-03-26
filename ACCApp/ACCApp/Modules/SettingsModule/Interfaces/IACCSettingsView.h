//
//  IACCSettingsView.h
//  ACCApp
//
//  Created by Bin Yu on 26/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

@protocol IACCSettingsView <NSObject>

- (void)searchRadiusDidUpdate:(NSNumber *)newValue;
- (void)searchCategoryIndexDidUpdate:(NSInteger)newIndex;

@end
