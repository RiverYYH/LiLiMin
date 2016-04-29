//
//  AuthcodeView.h
//  LiLiMi
//
//  Created by wangyongbo on 16/3/10.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthcodeView : UIView

//验证码字符串
@property (strong, nonatomic) NSMutableString *authCodeStr;

//是否可以点击来切换验证码
@property (nonatomic,assign) BOOL isCanTouch;

//切换验证码方法
-(void)chengeAuthcode;

//本地生成验证码init方法
- (instancetype)initWithChatCount:(NSInteger)charCount;

//服务器生成验证码init方法
- (instancetype)initWithNetwork;

@end
