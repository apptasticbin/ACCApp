//
//  ACCHttpService.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCHttpService.h"
#import "ACCSiteConfiguration.h"
#import <AFNetworking.h>

static NSTimeInterval kACCHttpServiceTimeOutForResource = 5.0f;

@interface ACCHttpService ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation ACCHttpService

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *SessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        SessionConfiguration.timeoutIntervalForResource = kACCHttpServiceTimeOutForResource;
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:ACCFourSquareBaseURL]
                                                   sessionConfiguration:SessionConfiguration];
    }
    return self;
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(ACCHttpServiceSuccessBlock)success
                      failure:(ACCHttpServiceFailureBlock)failure {
    NSDictionary *defaultParameters = @{
                                        ACCFourSquareClientIdKey : ACCFourSquareClientId,
                                        ACCFourSquareClientSecretKey : ACCFourSquareClientSecret,
                                        ACCFourSquareVersionKey : ACCFourSquareVersion
                                        };
    NSMutableDictionary *allParameters = [NSMutableDictionary dictionaryWithDictionary:defaultParameters];
    [allParameters addEntriesFromDictionary:parameters];
    
    return [self GET:URLString parameters:allParameters progress:nil success:success failure:failure];
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                     progress:(ACCHttpServiceProgressBlock)downloadProgress
                      success:(ACCHttpServiceSuccessBlock)success
                      failure:(ACCHttpServiceFailureBlock)failure {
    return [self.sessionManager GET:URLString
                         parameters:parameters
                           progress:downloadProgress
                            success:success
                            failure:failure];
}

@end
