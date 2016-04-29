//
//  APPTabBar.h
//
//  Created by wangyongbo on 15/10/15.
//  Copyright (c) 2015年 wangyongbo. All rights reserved.
//

#import <UIKit/UIKit.h>


@class APPTabBar;

@protocol APPTabBarDelegate;

@interface APPTabBar : UIView
@property (nonatomic, strong) NSMutableArray *btnArray;
/**
 *  添加按钮在tabBar上
 *
 *  @param item item模型
 */
- (void)addTabBarButtonWithItem:(UITabBarItem *)item tag:(int)tag;
-(void)setSelectedItem:(NSInteger)tag;
/**
 *  代理
 */
@property (nonatomic, weak) id<APPTabBarDelegate> delegate;

@end

@protocol APPTabBarDelegate <NSObject>

@optional
- (void)tabBar:(APPTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to;

@end