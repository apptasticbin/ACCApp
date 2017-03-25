//
//  ACCLocationService.h
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IACCLocationService.h"

FOUNDATION_EXPORT NSString * const ACCLocationServiceErrorDomain;
typedef NS_ENUM (NSUInteger, ACCLocationServiceErrorCode) {
    ACCLocationServiceErrorDenied = 1,
};

@interface ACCLocationService : NSObject<IACCLocationService>

@end
