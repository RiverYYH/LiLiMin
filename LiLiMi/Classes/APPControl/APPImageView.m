//
//  APPImageView.m
//  LiLiMi
//
//  Created by wangyongbo on 16/3/16.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "APPImageView.h"

@implementation APPImageView

- (instancetype)init
{
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    if (self = [super initWithFrame:frame]) {
//        self.userInteractionEnabled = YES;
//    }
//    return self;
//}

//点击事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    switch (self.imageViewStyle) {
        case APPImageViewUserHeader:
        {
            APPLog(@"－－－点击了用户头像－－－");
        }
            break;
            
        case APPImageViewPicture:
        {
            APPLog(@"－－－点击了相册图片－－－");
        }
            break;
            
        default:
            break;
    }
}

@end
