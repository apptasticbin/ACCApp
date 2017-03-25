//
//  ACCBaseDataModel.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCBaseDataModel.h"

@implementation ACCBaseDataModel

+ (void)parseDataAsync:(id)data complete:(ACCBaseDataModelParseCompleteBlock)completeBlock {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError *error;
        id parsedData = [MTLJSONAdapter modelOfClass:self fromJSONDictionary:data error:&error];
        if (completeBlock) {
            completeBlock(parsedData, error);
        }
    });
}

@end
