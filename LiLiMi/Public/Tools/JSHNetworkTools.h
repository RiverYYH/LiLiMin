//
//  JSHNetworkTools.h
//  FiteamSoft
//
//  Created by chun on 15/5/22.
//  Copyright (c) 2015年 cn.jianshenfan.www. All rights reserved.
//

#import "AFHTTPSessionManager.h"

//定义错误码返回
typedef void (^failure)(NSString* error);

typedef enum{
    KStatusUnknown,
    KStatusNotReachable,
    KStatusReachableViaWWAN,
    KStatusReachableViaWiFi
}netWorkStatus;
@interface JSHNetworkTools : AFHTTPSessionManager<UIAlertViewDelegate>
@property (nonatomic,assign)netWorkStatus startus;//状态
/**
 *  创建一个网络请求单例
 *
 */
+ (instancetype)shareNetworkTools;
@property (nonatomic,strong)NSProgress* progress;//进度

@end
