//
//  IACCHttpService.h
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

typedef void(^ACCHttpServiceSuccessBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void(^ACCHttpServiceFailureBlock)(NSURLSessionDataTask * task, NSError *error);
typedef void(^ACCHttpServiceProgressBlock)(NSProgress *downloadProgress);

@protocol IACCHttpService <NSObject>

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(ACCHttpServiceSuccessBlock)success
                      failure:(ACCHttpServiceFailureBlock)failure;

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                     progress:(ACCHttpServiceProgressBlock)downloadProgress
                      success:(ACCHttpServiceSuccessBlock)success
                      failure:(ACCHttpServiceFailureBlock)failure;

@end
