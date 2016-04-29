//
//  APPTitleLabel.h
//
//  Created by 高云 on 15/11/12.
//  Copyright © 2015年 wangyongbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APPTitleLabel : NSObject
/**
 *  设置APPTitleLabel
 *
 *  @param title        标题
 *  @param titleColor   标题颜色
 *  @param font         标题字体大小
 *
 *  @return UILabel
 */
+ (UILabel *)setBarButtonItemTitle:(NSString *)title titlecolor:(UIColor*)titlecolor font:(UIFont*)font;
@end
