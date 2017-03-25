//
//  ACCHttpService.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCHttpService.h"
#import <AFNetworking.h>

static NSString * const kFourSquareBaseURL              = @"https://api.foursquare.com/v2";

static NSString * const kFourSquareClientIdKey          = @"client_id";
static NSString * const kFourSquareClientSecretKey      = @"client_secret";
static NSString * const kFourSquareVersionKey           = @"v";

static NSString * const kFourSquareClientId             = @"NIVGCOEXFHGN2YA3XFFW3ZS2XG1U3QB4BO2LWTR5EU2S1M5H";
static NSString * const kFourSquareClientSecret         = @"0TG2XOEZI2WDZWUIKHRSZZQTSCWMTGE5EWGIEAKWQJDJSRXV";
static NSString * const kFourSquareVersion              = @"20170323";

@interface ACCHttpService ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation ACCHttpService

- (instancetype)init
{
    self = [super init];
    if (self) {
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kFourSquareBaseURL]];
    }
    return self;
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure {
    NSDictionary *defaultParameters = @{
                                        kFourSquareClientIdKey : kFourSquareClientId,
                                        kFourSquareClientSecretKey : kFourSquareClientSecret,
                                        kFourSquareVersionKey : kFourSquareVersion
                                        };
    NSMutableDictionary *allParameters = [NSMutableDictionary dictionaryWithDictionary:defaultParameters];
    [allParameters addEntriesFromDictionary:parameters];
    
    return [self GET:URLString parameters:allParameters progress:nil success:success failure:failure];
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                            parameters:(id)parameters
                              progress:(void (^)(NSProgress *downloadProgress))downloadProgress
                               success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure {
    return [self.sessionManager GET:URLString
                         parameters:parameters
                           progress:downloadProgress
                            success:success
                            failure:failure];
}

@end
