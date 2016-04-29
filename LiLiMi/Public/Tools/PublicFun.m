//
//  PublicFun.m
//  LiLiMi
//
//  Created by wangyongbo on 16/3/15.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "PublicFun.h"

@interface PublicFun()
{

}

@end

@implementation PublicFun

#pragma mark - 计算内容文本的高度方法
+ (CGFloat)HeightForText:(NSString *)text withFontSize:(CGFloat)fontSize withTextWidth:(CGFloat)textWidth
{
    // 获取文字字典
    NSDictionary *dict = @{NSFontAttributeName: setFont(fontSize)};
    // 设定最大宽高
    CGSize size = CGSizeMake(textWidth, 2000);
    // 计算文字Frame
    CGRect frame = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return frame.size.height;
}
@end
