//
//  ThirdPartyLoginView.h
//  LiLiMi
//
//  Created by wangyongbo on 16/3/9.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//


typedef NS_ENUM(NSInteger, ThirdPartyLoginStyle) {
    WEIXINLogin = 1,
    QQLogin = 2,
    WEIBOLogin = 3
};

#import <UIKit/UIKit.h>

@interface ThirdPartyLoginView : UIView

@property (nonatomic,copy) void (^loginClickBlock)(ThirdPartyLoginStyle loginStyle);

@end
