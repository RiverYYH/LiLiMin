//
//  NSDate+Extension.h
//  FiteamSoft
//
//  Created by chun on 15/6/2.
//  Copyright (c) 2015年 cn.jianshenfan.www. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)
/**
 @return 返回当前时区的时间
 */
+ (NSDate *)dateWithGMT;
/**
 @return 遥远的过去
 */
+ (NSDate *)dateWithDistantPast;
@end
