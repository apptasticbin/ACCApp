//
//  ACCBaseDataModel.h
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/MTLModel.h>
#import <Mantle/MTLJSONAdapter.h>

typedef void(^ACCBaseDataModelParseCompleteBlock)(id, NSError *);

@interface ACCBaseDataModel : MTLModel

+ (void)parseDataAsync:(id)data complete:(ACCBaseDataModelParseCompleteBlock)completeBlock;

@end
