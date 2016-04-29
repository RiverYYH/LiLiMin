//
//  NSDate+Extension.m
//  FiteamSoft
//
//  Created by chun on 15/6/2.
//  Copyright (c) 2015年 cn.jianshenfan.www. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)
/**
    @return 返回当前时区的时间
 */
+ (NSDate *)dateWithGMT{
    NSDate* nowData = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: nowData];
    NSDate *localeDate = [nowData  dateByAddingTimeInterval: interval];
    return localeDate;
}

/**
 @return 遥远的过去
 */
+ (NSDate *)dateWithDistantPast{
    return [NSDate distantPast];
}

@end
