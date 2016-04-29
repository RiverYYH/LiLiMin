//
//  RegisterViewController.h
//  LiLiMi
//
//  Created by wangyongbo on 16/3/4.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

typedef NS_ENUM(NSInteger, RegisterStyle) {
    RegisterLogin = 1,
    RegisterLogonPhoneNum,
    RegisterLogonVerification,
    RegisterLogonDone,
    RegisterForgetPassword,
    RegisterForgetPasswordVerification,
    RegisterSettingPassword
};

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

@property (nonatomic,assign) RegisterStyle registerStyle;

@property (nonatomic,copy) NSString *phoneNumStr;

@end
