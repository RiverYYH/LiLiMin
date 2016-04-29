//
//  JSHOtherNetTools.m
//  FiteamSoft
//
//  Created by chun on 15/7/6.
//  Copyright (c) 2015年 cn.jianshenfan.www. All rights reserved.
//

#import "JSHOtherNetTools.h"

@implementation JSHOtherNetTools
/**
 *  创建一个网络请求单例
 */
+ (instancetype)shareNetworkTools{
    
    static JSHOtherNetTools* tools = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[JSHOtherNetTools alloc]initWithBaseURL:[NSURL URLWithString:HOST_SERVER] sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        //AFN支持类型
        tools.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain" ,@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    });
    return tools;
}

@end
