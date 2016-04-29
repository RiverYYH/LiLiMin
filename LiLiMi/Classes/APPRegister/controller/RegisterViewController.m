//
//  RegisterViewController.m
//  LiLiMi
//
//  Created by wangyongbo on 16/3/4.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "RegisterViewController.h"

#import "ThirdPartyLoginView.h"
#import "AuthcodeView.h"
@interface RegisterViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) UILabel *mainTitleLabel;

@property (nonatomic,strong) UITextField *mainTextField;

@property (nonatomic,strong) UILabel *mainLabel;

@property (nonatomic,strong) UIButton *cleanButton;

@property (nonatomic,strong) UIView *lineView1;


@property (nonatomic,strong) UILabel *contentLabel;

@property (nonatomic,strong) UITextField *contentTextField;

@property (nonatomic,strong) UIButton *seePasswordButton;

@property (nonatomic,strong) UIView *lineView2;


@property (nonatomic,strong) UIButton *sureButton;

@property (nonatomic,strong) UIButton *varButton1;

@property (nonatomic,strong) UIButton *varButton2;


@property (nonatomic,strong) AuthcodeView *authCodeView;


@property (nonatomic,strong) ThirdPartyLoginView *thirdPartyLoginView;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //拓展边缘高度
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //注册登录状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(closeView)
                                                 name:closeRegistNoti
                                               object:nil];
    
    [self setupNavControl];
    [self setupControl];
    [self setupControlFontColor];
    [self setupControlText];
}

-(void)setupNavControl
{
    switch (self.registerStyle) {
        case RegisterLogin:
        {
            self.title = @"登录";
            UIBarButtonItem *closeBtn = [[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(closeView)];
            self.navigationItem.leftBarButtonItem = closeBtn;
        }
            break;
        
        case RegisterLogonPhoneNum:
            self.title = @"注册";
            break;
            
        case RegisterLogonVerification:
        case RegisterForgetPasswordVerification:
            self.title = @"填写校验码";
            break;
            
        case RegisterLogonDone:
            self.title = @"注册新用户";
            break;
            
        case RegisterForgetPassword:
            self.title = @"找回登录密码";
            break;
            
        case RegisterSettingPassword:
            self.title = @"设置新密码";
            break;
            
        default:
            break;
    }
}

-(void)setupControl
{
    if(self.registerStyle != RegisterLogonPhoneNum)
    {
        if (self.registerStyle != RegisterSettingPassword && self.registerStyle !=RegisterForgetPassword && self.registerStyle != RegisterSettingPassword) {
            UILabel *mainTitleLabel = [[UILabel alloc]init];
            self.mainTitleLabel = mainTitleLabel;
            [self.view addSubview:mainTitleLabel];
        }
        
        if (self.registerStyle != RegisterLogonVerification && self.registerStyle != RegisterForgetPasswordVerification) {
            UITextField *mainTextField = [[UITextField alloc]init];
            mainTextField.delegate = self;
            self.mainTextField = mainTextField;
            [self.view addSubview:mainTextField];
            
        }
        else{
            UILabel *mainLabel = [[UILabel alloc]init];
            self.mainLabel = mainLabel;
            [self.view addSubview:mainLabel];
            
        }
        
        if (self.registerStyle != RegisterSettingPassword && self.registerStyle !=RegisterForgetPassword && self.registerStyle != RegisterSettingPassword) {
            UIButton *cleanButton = [[UIButton alloc]init];
            [cleanButton addTarget:self action:@selector(cleanClick) forControlEvents:UIControlEventTouchUpInside];
            self.cleanButton = cleanButton;
            [self.view addSubview:cleanButton];
        }
        
        UIView *lineView1 = [[UIView alloc]init];
        self.lineView1 = lineView1;
        [self.view addSubview:lineView1];
    }
    
    if (self.registerStyle != RegisterSettingPassword && self.registerStyle !=RegisterForgetPassword && self.registerStyle != RegisterSettingPassword ) {
        UILabel *contentLabel = [[UILabel alloc]init];
        self.contentLabel = contentLabel;
        [self.view addSubview:contentLabel];
    }
    
    UITextField *contentTextField = [[UITextField alloc]init];
    contentTextField.delegate = self;
    self.contentTextField = contentTextField;
    [self.view addSubview:contentTextField];

    if(self.registerStyle != RegisterLogonPhoneNum && self.registerStyle != RegisterSettingPassword)
    {
        UIButton *seePasswordButton = [[UIButton alloc]init];
        [seePasswordButton addTarget:self action:@selector(seePasswordClick) forControlEvents:UIControlEventTouchUpInside];
        self.seePasswordButton = seePasswordButton;
        [self.view addSubview:seePasswordButton];
    }
        
    UIView *lineView2 = [[UIView alloc]init];
    self.lineView2 = lineView2;
    [self.view addSubview:lineView2];
    
    UIButton *sureButton = [[UIButton alloc]init];
    [sureButton addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
    self.sureButton = sureButton;
    [self.view addSubview:sureButton];
    
    if(self.registerStyle != RegisterLogonVerification && self.registerStyle !=RegisterForgetPassword  && self.registerStyle !=RegisterForgetPasswordVerification && self.registerStyle != RegisterSettingPassword)
    {
        UIButton *varButton1 = [[UIButton alloc]init];
        [varButton1 addTarget:self action:@selector(var1Click) forControlEvents:UIControlEventTouchUpInside];
        self.varButton1 = varButton1;
        [self.view addSubview:varButton1];
        
        if (self.registerStyle != RegisterLogonDone) {
            UIButton *varButton2 = [[UIButton alloc]init];
            [varButton2 addTarget:self action:@selector(var2Click) forControlEvents:UIControlEventTouchUpInside];
            self.varButton2 = varButton2;
            [self.view addSubview:varButton2];
        }
    }
    
    if (self.registerStyle == RegisterLogin) {
        ThirdPartyLoginView *thirdPartyLoginView = [[ThirdPartyLoginView alloc]init];
        [thirdPartyLoginView setLoginClickBlock:^(ThirdPartyLoginStyle loginStyle) {
            APPLog(@"登录方式－－－－%ld",loginStyle);
        }];
        self.thirdPartyLoginView = thirdPartyLoginView ;
        [self.view addSubview:thirdPartyLoginView];
    }
    
    if (self.registerStyle == RegisterForgetPassword) {
//        AuthcodeView *authCodeView = [[AuthcodeView alloc]initWithChatCount:4];
        AuthcodeView *authCodeView = [[AuthcodeView alloc]initWithNetwork];
        self.authCodeView = authCodeView;
        [self.view addSubview: authCodeView];
    }
}

- (void)setupControlFontColor
{
    self.mainTitleLabel.backgroundColor = [UIColor clearColor];
    [self.mainTitleLabel setTextColor:APPColorFromRGBA_0x(0x4a4a4a, 1)];
    self.mainTitleLabel.textAlignment = NSTextAlignmentLeft;
    
    self.mainTextField.backgroundColor = [UIColor clearColor];
    [self.mainTextField setFont:setFont(17)];
    [self.mainTextField setTextColor:APPColorFromRGBA_0x(0x000000, 1)];
    
    self.cleanButton.backgroundColor = APPColorFromRGBA_0x(0xe5e5e5, 1);
    
    self.lineView1.backgroundColor = APPColorFromRGBA_0x(0xe5e5e5, 1);
    
    self.contentLabel.backgroundColor = [UIColor clearColor];
    [self.contentLabel setTextColor:APPColorFromRGBA_0x(0x4a4a4a, 1)];
    [self.contentLabel setFont:setFont(16)];
    self.contentLabel.textAlignment = NSTextAlignmentLeft;
    
    self.contentTextField.backgroundColor = [UIColor clearColor];
    [self.contentTextField setFont:setFont(17)];
    [self.contentTextField setTextColor:APPColorFromRGBA_0x(0x000000, 1)];
    
    self.seePasswordButton.backgroundColor = APPColorFromRGBA_0x(0xe5e5e5, 1);

    self.lineView2.backgroundColor = APPColorFromRGBA_0x(0xe5e5e5, 1);
    
    [self.sureButton.titleLabel setFont:setFont(17)];
    [self.sureButton setTitleColor:APPColorFromRGBA_0x(0xffffff, 1) forState:UIControlStateNormal];
    [self.sureButton setBackgroundColor:APPColorFromRGBA_0x(0x63bfff, 1)];
//    [self.sureButton setBackgroundColor:APPColorFromRGBA_0x(0xdddddd, 1)];
    
    switch (self.registerStyle) {
        case RegisterLogin:
        {
            [self.mainTitleLabel setFont:setFont(16)];
            self.mainTextField.keyboardType = UIKeyboardTypeNumberPad;
            self.contentTextField.keyboardType = UIKeyboardTypeNamePhonePad;
            self.contentTextField.secureTextEntry = YES;
            [self.varButton1 setTitleColor:APPColorFromRGBA_0x(0x9b9b9b, 1) forState:UIControlStateNormal];
            [self.varButton1.titleLabel setFont:setFont(12)];
            
            [self.varButton2 setTitleColor:APPColorFromRGBA_0x(0x44b2ff, 1) forState:UIControlStateNormal];
            [self.varButton2.titleLabel setFont:setFont(12)];
        }
            break;
            
        case RegisterLogonPhoneNum:
        {
            [self.contentLabel setFont:setFont(16)];
            self.contentTextField.keyboardType = UIKeyboardTypeNumberPad;
            [self.varButton1 setTitleColor:APPColorFromRGBA_0x(0x9b9b9b, 1) forState:UIControlStateNormal];
            [self.varButton1.titleLabel setFont:setFont(13)];
            
            [self.varButton2 setTitleColor:APPColorFromRGBA_0x(0xff7200, 1) forState:UIControlStateNormal];
            [self.varButton2.titleLabel setFont:setFont(13)];
        }
            break;
            
        case RegisterLogonVerification:
        case RegisterForgetPasswordVerification:
        {
            [self.mainTitleLabel setFont:setFont(13)];
            
            self.mainLabel.backgroundColor = [UIColor clearColor];
            [self.mainLabel setTextColor:APPColorFromRGBA_0x(0x44b2ff, 1)];
            [self.mainLabel setFont:setFont(17)];
            self.mainLabel.textAlignment = NSTextAlignmentCenter;
            
            [self.cleanButton.titleLabel setFont:setFont(13)];
            [self.cleanButton setTitleColor:APPColorFromRGBA_0x(0x4a4a4a, 1) forState:UIControlStateNormal];
            
            self.contentTextField.keyboardType = UIKeyboardTypeNumberPad;
            
            [self.seePasswordButton.titleLabel setFont:setFont(17)];
            [self.seePasswordButton setTitleColor:APPColorFromRGBA_0x(0x4a4a4a, 1) forState:UIControlStateNormal];
            [self.seePasswordButton setTitleColor:APPColorFromRGBA_0x(0xc8c8c8, 1) forState:UIControlStateDisabled];
        }
            break;
            
        case RegisterLogonDone:
        {
            self.contentTextField.keyboardType = UIKeyboardTypeNamePhonePad;
            self.contentTextField.secureTextEntry = YES;
            [self.varButton1 setTitleColor:APPColorFromRGBA_0x(0x9b9b9b, 1) forState:UIControlStateNormal];
            [self.varButton1.titleLabel setFont:setFont(13)];
            
        }
            break;
            
        case RegisterForgetPassword:
        {
            [self.contentTextField setFont:setFont(15)];
            [self.seePasswordButton.titleLabel setFont:setFont(15)];
            [self.seePasswordButton setBackgroundColor:APPColorFromRGBA_0x(0x63bfff, 1)];
            [self.seePasswordButton setTitleColor:APPColorFromRGBA_0x(0xffffff, 1) forState:UIControlStateNormal];
            self.mainTextField.keyboardType = UIKeyboardTypeNumberPad;
            self.contentTextField.keyboardType = UIKeyboardTypeASCIICapable;
        }
            break;
            
        case RegisterSettingPassword:
        {
            [self.contentTextField setFont:setFont(17)];
            self.mainTextField.secureTextEntry = YES;
            self.contentTextField.secureTextEntry = YES;
        }
            break;
            
        default:
            break;
    }
}

- (void)setupControlText
{
    switch (self.registerStyle) {
        case RegisterLogin:
        {
            [self.mainTitleLabel setText:@"帐号"];
            [self.contentLabel setText:@"密码"];
             self.contentTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入密码" attributes:@{NSForegroundColorAttributeName: APPColorFromRGBA_0x(0xA5A5A5, 1)}];
            [self.sureButton setTitle:@"登 录" forState:UIControlStateNormal];
            [self.varButton1 setTitle:@"免费注册" forState:UIControlStateNormal];
            [self.varButton2 setTitle:@"忘记密码？" forState:UIControlStateNormal];
        }
            break;
          
        case RegisterLogonPhoneNum:
        {
            [self.contentLabel setText:@"手机号"];
            self.contentTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:@{NSForegroundColorAttributeName: APPColorFromRGBA_0x(0xA5A5A5, 1)}];
            [self.sureButton setTitle:@"下一步" forState:UIControlStateNormal];
            [self.varButton1 setTitle:@"提示：注册即视为同意" forState:UIControlStateNormal];
            [self.varButton2 setTitle:@"粒粒米用户协议" forState:UIControlStateNormal];
        }
            break;
            
        case RegisterLogonVerification:
        case RegisterForgetPasswordVerification:
        {
            [self.mainTitleLabel setText:@"请输入手机号"];
            [self.mainLabel setText:self.phoneNumStr];
            [self.cleanButton setTitle:@"收到的短信校验码" forState:UIControlStateNormal];
            [self.contentLabel setText:@"校验码"];
            self.contentTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"短信校验码" attributes:@{NSForegroundColorAttributeName: APPColorFromRGBA_0x(0xA5A5A5, 1)}];
            [self.seePasswordButton setTitle:@"重新发送" forState:UIControlStateNormal];
            [self.sureButton setTitle:@"下一步" forState:UIControlStateNormal];
            [self.varButton1 setTitle:@"提示：注册即视为同意" forState:UIControlStateNormal];
            [self.varButton2 setTitle:@"粒粒米用户协议" forState:UIControlStateNormal];
        }
            break;
            
        case RegisterLogonDone:
        {
            [self.mainTitleLabel setText:@"新昵称"];
            [self.contentLabel setText:@"新密码"];
            self.contentTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入密码" attributes:@{NSForegroundColorAttributeName: APPColorFromRGBA_0x(0xA5A5A5, 1)}];
            [self.sureButton setTitle:@"完 成" forState:UIControlStateNormal];
            [self.varButton1 setTitle:@"点击完成后会自动登录粒粒米哦！" forState:UIControlStateNormal];
        }
            break;
            
        case RegisterForgetPassword:
        {
            self.mainTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:@{NSForegroundColorAttributeName: APPColorFromRGBA_0x(0xA5A5A5, 1)}];

            self.contentTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入右图验证码" attributes:@{NSForegroundColorAttributeName: APPColorFromRGBA_0x(0xA5A5A5, 1)}];

            [self.seePasswordButton setTitle:@"换一张" forState:UIControlStateNormal];
            
            [self.sureButton setTitle:@"下一步" forState:UIControlStateNormal];
        }
            break;
            
        case RegisterSettingPassword:
        {
            self.mainTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"新密码" attributes:@{NSForegroundColorAttributeName: APPColorFromRGBA_0x(0xA5A5A5, 1)}];
            
            self.contentTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"确认新密码" attributes:@{NSForegroundColorAttributeName: APPColorFromRGBA_0x(0xA5A5A5, 1)}];
            
            [self.sureButton setTitle:@"完 成" forState:UIControlStateNormal];
        }
            break;
            
        default:
            break;
    }
}

- (void)viewWillLayoutSubviews
{
    switch (self.registerStyle) {
        case RegisterLogin:
        {
            //用户名布局
            [self.mainTitleLabel setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 0, 130 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            [self.mainTextField setFrame:CGRectMake(180 * ADAPTIVE_PROPORTION, 0, 372 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            [self.cleanButton setFrame:CGRectMake(558 * ADAPTIVE_PROPORTION, 0, 88 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            [self.lineView1 setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION, 610 * ADAPTIVE_PROPORTION, 1 )];
            
            //密码布局
            [self.contentLabel setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION, 130 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            [self.contentTextField setFrame:CGRectMake(180 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION, 372 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            [self.seePasswordButton setFrame:CGRectMake(558 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            [self.lineView2 setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 176 * ADAPTIVE_PROPORTION, 610 * ADAPTIVE_PROPORTION, 1 )];
            
            //登录布局
            [self.sureButton setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 200 * ADAPTIVE_PROPORTION, 580 * ADAPTIVE_PROPORTION, 80 * ADAPTIVE_PROPORTION)];
            
            //注册
            [self.varButton1 setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 300 * ADAPTIVE_PROPORTION, 100 * ADAPTIVE_PROPORTION, 46 * ADAPTIVE_PROPORTION)];
            
            //忘记密码
            [self.varButton2 setFrame:CGRectMake(500 * ADAPTIVE_PROPORTION, 300 * ADAPTIVE_PROPORTION, 120 * ADAPTIVE_PROPORTION, 46 * ADAPTIVE_PROPORTION)];
            
            //第三方登录布局
            [self.thirdPartyLoginView setFrame:CGRectMake(0, 430 * ADAPTIVE_PROPORTION, 640 * ADAPTIVE_PROPORTION, 240 * ADAPTIVE_PROPORTION)];
        }
            break;
            
        case RegisterLogonPhoneNum:
        {
            //手机号布局
            [self.contentLabel setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION , 0, 130 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            [self.contentTextField setFrame:CGRectMake(180 * ADAPTIVE_PROPORTION, 0, 372 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            [self.lineView2 setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION, 610 * ADAPTIVE_PROPORTION, 1 )];
            
            //下一步
            [self.sureButton setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 112 * ADAPTIVE_PROPORTION, 580 * ADAPTIVE_PROPORTION, 80 * ADAPTIVE_PROPORTION)];
            
            //title
            [self.varButton1 setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 254 * ADAPTIVE_PROPORTION, 280 * ADAPTIVE_PROPORTION, 46 * ADAPTIVE_PROPORTION)];
            
            //协议
            [self.varButton2 setFrame:CGRectMake(295 * ADAPTIVE_PROPORTION, 254 * ADAPTIVE_PROPORTION, 200 * ADAPTIVE_PROPORTION, 46 * ADAPTIVE_PROPORTION)];
        }
            break;
        case RegisterLogonVerification:
        case RegisterForgetPasswordVerification:
        {
            //手机号
            [self.mainTitleLabel setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 0, 160 * ADAPTIVE_PROPORTION, 70 * ADAPTIVE_PROPORTION)];
            [self.mainLabel setFrame:CGRectMake(185 * ADAPTIVE_PROPORTION, 0, 220 * ADAPTIVE_PROPORTION, 70 * ADAPTIVE_PROPORTION)];
            [self.cleanButton setFrame:CGRectMake(400 * ADAPTIVE_PROPORTION, 0, 220 * ADAPTIVE_PROPORTION, 70 * ADAPTIVE_PROPORTION)];
            [self.lineView1 setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 70 * ADAPTIVE_PROPORTION, 610 * ADAPTIVE_PROPORTION, 1 )];
            
            //密码布局
            [self.contentLabel setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION , 70 * ADAPTIVE_PROPORTION, 130 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            [self.contentTextField setFrame:CGRectMake(180 * ADAPTIVE_PROPORTION, 70 * ADAPTIVE_PROPORTION, 372 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            [self.seePasswordButton setFrame:CGRectMake(425 * ADAPTIVE_PROPORTION, 70 * ADAPTIVE_PROPORTION, 200 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            [self.lineView2 setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 158 * ADAPTIVE_PROPORTION, 610 * ADAPTIVE_PROPORTION, 1 )];
            
            //登录布局
            [self.sureButton setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 182 * ADAPTIVE_PROPORTION, 580 * ADAPTIVE_PROPORTION, 80 * ADAPTIVE_PROPORTION)];
        }
            break;
        case RegisterLogonDone:
        {
            //用户名布局
            [self.mainTitleLabel setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 0, 130 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            [self.mainTextField setFrame:CGRectMake(180 * ADAPTIVE_PROPORTION, 0, 372 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            [self.cleanButton setFrame:CGRectMake(558 * ADAPTIVE_PROPORTION, 0, 88 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            [self.lineView1 setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION, 610 * ADAPTIVE_PROPORTION, 1 )];
            
            //密码布局
            [self.contentLabel setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION, 130 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            [self.contentTextField setFrame:CGRectMake(180 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION, 372 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            [self.seePasswordButton setFrame:CGRectMake(558 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            [self.lineView2 setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 176 * ADAPTIVE_PROPORTION, 610 * ADAPTIVE_PROPORTION, 1 )];
            
            //登录布局
            [self.sureButton setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 200 * ADAPTIVE_PROPORTION, 580 * ADAPTIVE_PROPORTION, 80 * ADAPTIVE_PROPORTION)];
            
            //注册
            [self.varButton1 setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 360 * ADAPTIVE_PROPORTION, 400 * ADAPTIVE_PROPORTION, 46 * ADAPTIVE_PROPORTION)];
        }
            break;
        case RegisterForgetPassword:
        {
            [self.mainTextField setFrame:CGRectMake(34 * ADAPTIVE_PROPORTION, 0, 572 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
             [self.lineView1 setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION, 610 * ADAPTIVE_PROPORTION, 1 )];
            [self.contentTextField setFrame:CGRectMake(34 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION, 240 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            
            [self.authCodeView setFrame:CGRectMake(290 * ADAPTIVE_PROPORTION, 96 * ADAPTIVE_PROPORTION, 150 * ADAPTIVE_PROPORTION, 76 * ADAPTIVE_PROPORTION)];
            
            [self.seePasswordButton setFrame:CGRectMake(460 * ADAPTIVE_PROPORTION, 102 * ADAPTIVE_PROPORTION, 150 * ADAPTIVE_PROPORTION, 60 * ADAPTIVE_PROPORTION)];
            
            [self.lineView2 setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 176 * ADAPTIVE_PROPORTION, 610 * ADAPTIVE_PROPORTION, 1 )];
            //下一步布局
            [self.sureButton setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 200 * ADAPTIVE_PROPORTION, 580 * ADAPTIVE_PROPORTION, 80 * ADAPTIVE_PROPORTION)];
        }
            break;
            
        case RegisterSettingPassword:
        {
            [self.mainTextField setFrame:CGRectMake(34 * ADAPTIVE_PROPORTION, 0, 572 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            [self.lineView1 setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION, 610 * ADAPTIVE_PROPORTION, 1 )];
            [self.contentTextField setFrame:CGRectMake(34 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION, 572 * ADAPTIVE_PROPORTION, 88 * ADAPTIVE_PROPORTION)];
            
            [self.lineView2 setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 176 * ADAPTIVE_PROPORTION, 610 * ADAPTIVE_PROPORTION, 1 )];
            //下一步布局
            [self.sureButton setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 200 * ADAPTIVE_PROPORTION, 580 * ADAPTIVE_PROPORTION, 80 * ADAPTIVE_PROPORTION)];
        }
            break;
            
        default:
            break;
    }
}
#pragma mark 关闭页面
- (void)closeView
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

-(void)sureClick
{
    [self.view endEditing:YES];
    switch (self.registerStyle) {
        case RegisterLogin:
        {
            APPLog(@"账户：%@",self.mainTextField.text);
            APPLog(@"密码：%@",self.contentTextField.text);
            [(AppDelegate*)[UIApplication sharedApplication].delegate loginWithUsername:self.mainTextField.text password:self.contentTextField.text];
        }
            break;
            
        case RegisterLogonPhoneNum:
        {
            RegisterViewController *registerViewController = [[RegisterViewController alloc]init];
            registerViewController.registerStyle = RegisterLogonVerification;
            registerViewController.phoneNumStr = self.contentTextField.text;
            [self.navigationController pushViewController: registerViewController animated:YES];
        }
            break;
        case RegisterLogonVerification:
        {
            RegisterViewController *registerViewController = [[RegisterViewController alloc]init];
            registerViewController.registerStyle = RegisterLogonDone;
            [self.navigationController pushViewController: registerViewController animated:YES];
        }
            break;
        case RegisterLogonDone:
        {
            
        }
            break;
        case RegisterForgetPassword:
        {
            RegisterViewController *registerViewController = [[RegisterViewController alloc]init];
            registerViewController.registerStyle = RegisterForgetPasswordVerification;
            registerViewController.phoneNumStr = self.mainTextField.text;
            [self.navigationController pushViewController: registerViewController animated:YES];
        }
            break;
            
        case RegisterForgetPasswordVerification:
        {
            RegisterViewController *registerViewController = [[RegisterViewController alloc]init];
            registerViewController.registerStyle = RegisterSettingPassword;
            [self.navigationController pushViewController: registerViewController animated:YES];
        }
            break;
            
        case RegisterSettingPassword:
        {
            
        }
            break;
            
        default:
            break;
    }
}

-(void)var1Click
{
    [self.view endEditing:YES];
    switch (self.registerStyle) {
        case RegisterLogin:
        {
            RegisterViewController *registerViewController = [[RegisterViewController alloc]init];
            registerViewController.registerStyle = RegisterLogonPhoneNum;
            [self.navigationController pushViewController: registerViewController animated:YES];
        }
            break;
            
        default:
            break;
    }
}

-(void)var2Click
{
    [self.view endEditing:YES];
    switch (self.registerStyle) {
        case RegisterLogin:
        {
            RegisterViewController *registerViewController = [[RegisterViewController alloc]init];
            registerViewController.registerStyle = RegisterForgetPassword;
            [self.navigationController pushViewController: registerViewController animated:YES];
        }
            break;
            
        case RegisterLogonPhoneNum:
        {
            
        }
            break;
            
        default:
            break;
    }
}

-(void)seePasswordClick
{
    switch (self.registerStyle) {
        case RegisterLogin:
        case RegisterLogonDone:
        {
            self.contentTextField.secureTextEntry = self.contentTextField.secureTextEntry?NO:YES;
        }
            break;
            
        case RegisterLogonVerification:
        case RegisterForgetPasswordVerification:
        {
            
        }
            break;

        case RegisterForgetPassword:
        {
            [self.authCodeView chengeAuthcode];
        }
            break;
            
        default:
            break;
    }
}

-(void)cleanClick
{
    switch (self.registerStyle) {
        case RegisterLogin:
        case RegisterLogonDone:
        {
            self.mainTextField.text = @"";
            self.contentTextField.text = @"";
        }
            break;
            
        default:
            break;
    }
}

#pragma mark 点击界面切换验证码
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
