//
//  ThirdPartyLoginView.m
//  LiLiMi
//
//  Created by wangyongbo on 16/3/9.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "ThirdPartyLoginView.h"
#import "ThirdPartyLoginTitleView.h"

@interface ThirdPartyLoginView()

@property (nonatomic,strong) ThirdPartyLoginTitleView *titleView;

@property (nonatomic,strong) UIButton *weixinLoginButton;

@property (nonatomic,strong) UIButton *qqLoginButton;

@property (nonatomic,strong) UIButton *weiboLoginButton;

@end

@implementation ThirdPartyLoginView

-(instancetype)init
{
    if (self = [super init]) {
        [self setupControl];
    }
    return self;
}

-(void)setupControl
{
    ThirdPartyLoginTitleView *titleView = [[ThirdPartyLoginTitleView alloc]init];
    self.titleView = titleView;
    [self addSubview:titleView];
    
    UIButton *weixinLoginButton = [[UIButton alloc]init];
    [weixinLoginButton setBackgroundColor:[UIColor blackColor]];
    weixinLoginButton.tag = WEIXINLogin;
    [weixinLoginButton addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    self.weixinLoginButton = weixinLoginButton;
    [self addSubview:weixinLoginButton];
    
    UIButton *qqLoginButton = [[UIButton alloc]init];
    [qqLoginButton setBackgroundColor:[UIColor blackColor]];
    qqLoginButton.tag = QQLogin;
    [qqLoginButton addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    self.qqLoginButton = qqLoginButton;
    [self addSubview:qqLoginButton];
    
    UIButton *weiboLoginButton = [[UIButton alloc]init];
    [weiboLoginButton setBackgroundColor:[UIColor blackColor]];
    weiboLoginButton.tag = WEIBOLogin;
    [weiboLoginButton addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    self.weiboLoginButton = weiboLoginButton;
    [self addSubview:weiboLoginButton];
}

-(void)layoutSubviews
{
    [self.titleView setFrame:CGRectMake(0, 0, 640 * ADAPTIVE_PROPORTION, 45 * ADAPTIVE_PROPORTION)];
    
    [self.weixinLoginButton setFrame:CGRectMake(87 * ADAPTIVE_PROPORTION, 77 * ADAPTIVE_PROPORTION, 102 * ADAPTIVE_PROPORTION, 102 * ADAPTIVE_PROPORTION)];
    [self.qqLoginButton setFrame:CGRectMake(269 * ADAPTIVE_PROPORTION, 77 * ADAPTIVE_PROPORTION, 102 * ADAPTIVE_PROPORTION, 102 * ADAPTIVE_PROPORTION)];
    [self.weiboLoginButton setFrame:CGRectMake(451 * ADAPTIVE_PROPORTION, 77 * ADAPTIVE_PROPORTION, 102 * ADAPTIVE_PROPORTION, 102 * ADAPTIVE_PROPORTION)];
}

-(void)loginClick:(id)sender
{
    if (((UIButton *)sender).tag != 0) {
        self.loginClickBlock(((UIButton *)sender).tag);
    }
}

@end
