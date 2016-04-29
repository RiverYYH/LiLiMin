//
//  JSHNetworkTools.m
//  FiteamSoft
//
//  Created by chun on 15/5/22.
//  Copyright (c) 2015年 cn.jianshenfan.www. All rights reserved.
//

#import "JSHNetworkTools.h"

//测试地址
NSString* const test = @"";

@interface JSHNetworkTools ()

@end
@implementation JSHNetworkTools
/**
 *  创建一个网络请求单例
 *
 */
+ (instancetype)shareNetworkTools{
    static JSHNetworkTools* tools = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration*sessionconfig=[NSURLSessionConfiguration defaultSessionConfiguration];
        sessionconfig.timeoutIntervalForRequest=60.f;
        tools = [[JSHNetworkTools alloc]initWithBaseURL:[NSURL URLWithString:HOST_SERVER] sessionConfiguration:sessionconfig];
        //AFN支持类型
        tools.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain" ,@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    });
    return tools;
}
/**
 *  初始化单例，并判断网络
 *
 *  @param url           基本地址
 *  @param configuration
 *
 */
- (instancetype)initWithBaseURL:(NSURL *)url sessionConfiguration:(NSURLSessionConfiguration *)configuration{
    if (    self = [super initWithBaseURL:url sessionConfiguration:configuration]) {
        //判断是否有网络
        AFNetworkReachabilityManager* mgr = [AFNetworkReachabilityManager sharedManager];
        [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusUnknown:{
                    APPLog(@"未知网络");
                    self.startus = KStatusUnknown;
                }
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                {
                    APPLog(@"没有网络");
                    self.startus = KStatusNotReachable;
                }
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN:
                {
                    APPLog(@"手机自带网络");
                    self.startus = KStatusReachableViaWWAN;
                }
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi:
                {
                    APPLog(@"wifi");
                    self.startus = KStatusReachableViaWiFi;
                }
                    break;
                default:
                    break;
            }
        }];
        //开始监控
        [mgr startMonitoring];
    }
    return self;
}

/**
 *  获得七牛上传的token
 *
 *  @param bucket_type,key,verifykey
 *  @param success 成功回调
 *  @param failure 失败回调

- (void)GetQuToken:(NSString *)bucket_type key:(NSString *)key  success:(void (^)(JSFGetQuTokenModel* tokenModel))success failure:(failure)failure{
    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
    parameters[@"bucket_type"] = bucket_type;
    parameters[@"key"] = key;
    parameters[@"verifykey"] = ACCESS_TOKEN;
    [[JSHNetworkTools shareNetworkTools]GET:GetQuTokenUrl parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if ([responseObject[@"result"] isEqualToString:@"1"])
        {
            JSFGetQuTokenModel *tokenModel = [JSFGetQuTokenModel mj_objectWithKeyValues:responseObject[@"retValue"]];
            success(tokenModel);
        }
        else
        {
            failure(responseObject[@"message"]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure([error localizedDescription]);
    }];
}
 */

@end
