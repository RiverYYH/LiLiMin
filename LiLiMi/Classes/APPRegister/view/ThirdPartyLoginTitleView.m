//
//  ThirdPartyLoginTitleView.m
//  LiLiMi
//
//  Created by wangyongbo on 16/3/9.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "ThirdPartyLoginTitleView.h"

@interface ThirdPartyLoginTitleView()

@property (nonatomic,strong) UIView *LeftLineView;

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UIView *RightLineView;

@end

@implementation ThirdPartyLoginTitleView

-(instancetype)init
{
    if (self = [super init]) {
        [self setupControl];
    }
    return self;
}

-(void)setupControl
{
    UIView *LeftLineView = [[UIView alloc]init];
    LeftLineView.backgroundColor = APPColorFromRGBA_0x(0xe5e5e5, 1);
    self.LeftLineView = LeftLineView;
    [self addSubview:LeftLineView];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.font = setFont(12);
    titleLabel.textColor = APPColorFromRGBA_0x(0x4a4a4a, 1);
    titleLabel.text = @"其它方式登录";
    self.titleLabel = titleLabel;
    [self addSubview:titleLabel];
    
    UIView *RightLineView = [[UIView alloc]init];
    RightLineView.backgroundColor = APPColorFromRGBA_0x(0xe5e5e5, 1);
    self.RightLineView = RightLineView;
    [self addSubview:RightLineView];
}

-(void)layoutSubviews
{
    [self.LeftLineView setFrame:CGRectMake(50 * ADAPTIVE_PROPORTION, 23 * ADAPTIVE_PROPORTION, 192 * ADAPTIVE_PROPORTION, 1)];
    
    [self.titleLabel setFrame:CGRectMake(242 * ADAPTIVE_PROPORTION, 0, 156 * ADAPTIVE_PROPORTION, 45 * ADAPTIVE_PROPORTION)];
    
    [self.RightLineView setFrame:CGRectMake(398 * ADAPTIVE_PROPORTION, 23 * ADAPTIVE_PROPORTION, 192 * ADAPTIVE_PROPORTION, 1)];
}

@end
