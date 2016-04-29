//
//  JSHOtherNetTools.h
//  FiteamSoft
//
//  Created by chun on 15/7/6.
//  Copyright (c) 2015年 cn.jianshenfan.www. All rights reserved.
//

#import "AFHTTPSessionManager.h"


@interface JSHOtherNetTools : AFHTTPSessionManager
/**
 *  创建一个网络请求单例
 *
 */
+ (instancetype)shareNetworkTools;

@end
