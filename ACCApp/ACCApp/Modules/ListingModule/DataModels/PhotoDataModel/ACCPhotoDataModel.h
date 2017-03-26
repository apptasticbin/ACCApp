//
//  ACCPhotoDataModel.h
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ACCBaseDataModel.h"

@interface ACCPhotoDataModel : ACCBaseDataModel<MTLJSONSerializing>

@property (nonatomic, strong) NSString *prefix;
@property (nonatomic, strong) NSString *suffix;
@property (nonatomic, strong) NSNumber *width;
@property (nonatomic, strong) NSNumber *height;

- (NSString *)thumbnailUrlString;

@end
