//
//  UIBarButtonItem+Extension.h
//  FiteamSoft
//
//  Created by ChuanRao on 15/5/23.
//  Copyright (c) 2015年 cn.jianshenfan.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
/**
 *  设置UIBarButtonItem
 *
 *  @param CurrImage        默认图片
 *  @param highlightedImage 高亮图片
 *  @param target           接收控制器
 *  @param action           方法
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)setBarButtonItemImage:(UIImage *)CurrImage  highlightedImage:(UIImage *)highlightedImage title:(NSString*)title titlecolor:(UIColor*)titlecolor target:(id) target action:(SEL)action isleftbtn:(BOOL)isleftbtn down:(BOOL)down showred:(BOOL)showred;
@end
