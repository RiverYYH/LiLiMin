//
//  APPTabBarMainButton.m
//  LiLiMi
//
//  Created by wangyongbo on 16/3/4.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "APPTabBarMainButton.h"

#define BTN_IMG_RATIO 0.75

@implementation APPTabBarMainButton

#pragma mark 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        //图标居中
        self.imageView.contentMode = UIViewContentModeCenter;
        //文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //字体大小
        self.titleLabel.font = setFont(9);
        //字体颜色
        [self setTitleColor:APPColorFromRGBA(138, 138, 138, 1.0) forState:UIControlStateNormal];
        [self setTitleColor:APPColorFromRGBA_0x(0xfabb00,1) forState:UIControlStateSelected];
        //选中背景颜色
        //[self setBackgroundImage:[UIImage imageNamed:@"tab_btn_bg"] forState:UIControlStateSelected];
    }
    return self;
}

#pragma mark 重写高亮方法去掉高亮状态
- (void)setHighlighted:(BOOL)highlighted{}

#pragma mark 设置背景图片位置
-(CGRect)backgroundRectForBounds:(CGRect)bounds
{
    CGFloat imageW = bounds.size.width;
    CGFloat imageH = bounds.size.width;
    return CGRectMake(0, 0, imageW, imageH);
}

#pragma mark 设置内部文字位置
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height - contentRect.size.height / 1.4 * (1 - BTN_IMG_RATIO);
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY-3, titleW, titleH);
}


@end
