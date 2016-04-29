//
//  PublicFun.h
//  LiLiMi
//
//  Created by wangyongbo on 16/3/15.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicFun : NSObject

#pragma mark - 计算内容文本的高度方法
/**
 *  计算文本高度
 *
 *  @param text      需要计算的文本
 *  @param fontSize  字体大小
 *  @param textWidth Label控件宽度
 *
 *  @return 计算高度的结果
 */
+ (CGFloat)HeightForText:(NSString *)text withFontSize:(CGFloat)fontSize withTextWidth:(CGFloat)textWidth;


@end
