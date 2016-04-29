//
//  HomeHeaderTitleButton.m
//  lilimihomedemo
//
//  Created by Wxingyuan on 16/4/19.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "HomeHeaderTitleButton.h"

@implementation HomeHeaderTitleButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
//        self.titleLabel.font = [UIFont systemFontOfSize:16];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

//- (CGRect)contentRectForBounds:(CGRect)bounds
//{
//    return CGRectMake(0, 0, 0, 0);
//}

#pragma mark 设置内部图片位置
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = contentRect.size.width * 20.5 / 116;
    CGFloat imageY = 0;
    CGFloat imageW = contentRect.size.width * 75 / 116;
    CGFloat imageH = contentRect.size.width * 75 / 116;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

#pragma mark 设置内部文字位置
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = contentRect.size.width * 75 / 116;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.width * 30 / 116;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

//- (CGRect)backgroundRectForBounds:(CGRect)bounds
//{
//    CGFloat imageX = 0;
//    CGFloat imageY = 0;
//    CGFloat imageW = self.bounds.size.width;
//    CGFloat imageH = self.bounds.size.width;
//    return CGRectMake(imageX, imageY, imageW, imageH);
//}

@end
