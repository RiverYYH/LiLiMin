//
//  APPTitleLabel.m
//
//  Created by 高云 on 15/11/12.
//  Copyright © 2015年 wangyongbo. All rights reserved.
//

#import "APPTitleLabel.h"

@implementation APPTitleLabel
/**
 *  设置APPTitleLabel
 *
 *  @param title        标题
 *  @param titleColor   标题颜色
 *  @param font         标题字体大小
 *
 *  @return UILabel
 */
+ (UILabel *)setBarButtonItemTitle:(NSString *)title titlecolor:(UIColor*)titlecolor font:(UIFont*)font
{
    UILabel* titlelab = [[UILabel alloc]init];
    titlelab.font=setFont(20);
    titlelab.textColor=APPColorFromRGBA_0x(0x29282e,1);
    if (title) {
        titlelab.text=title;
        [titlelab sizeToFit];
    }
    if (titlecolor) {
       titlelab.textColor=titlecolor;
    }
    if (font) {
        titlelab.font=font;
    }
    return titlelab;
}
@end
