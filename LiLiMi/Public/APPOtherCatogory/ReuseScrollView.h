//
//  ReuseScrollView.h
//  FiteamSoft
//
//  Created by wangyongbo on 15/10/28.
//  Copyright (c) 2015年 wangyongbo. All rights reserved.
//封装后可以支持scrollView重
//  此文件是自定义ScrollView   用
//
//  ReuseView为在scrollview上重用的视图
//

#import <UIKit/UIKit.h>


#pragma mark - MLuReuseView 重用视图

@interface ReuseView : UIView

@property (nonatomic, copy, readonly) NSString *identifier;

@property (nonatomic, assign, readonly) NSInteger index;

/**
 初始化用这个.
 */
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;

@end


#pragma mark - ReuseScrollView   支持重用的ScrollView

@class ReuseScrollView;

@protocol ReuseScrollViewDelegate <NSObject>

@optional

/**
 获取对应下标的偏移量(可以用来做间隔).
 */
- (UIEdgeInsets)scrollView:(ReuseScrollView *)scrollView insetForForItemAtIndex:(NSInteger)index;

@end

@protocol ReuseScrollViewDataSource <NSObject>

@required

/**
 一共有几个元素.
 */
- (NSInteger)numberOfItemsInScrollView:(ReuseScrollView *)scrollView;

/**
 获取对应下标的view.
 */
- (ReuseView *)scrollView:(ReuseScrollView *)scrollView viewForItemAtIndex:(NSInteger)index;

@end

@interface ReuseScrollView : UIScrollView

/**
 如果直接设置这个属性, 则所有reuseView的inset都一致.
 想要单独设置某个view的inset可以使用MLuReuseScrollViewDelegate协议内的方法.
 */
@property (nonatomic, assign) UIEdgeInsets reuseViewInset;

/**
 前后保留的页数, 默认是2.(前后各会保留preloadNum个view)
 */
@property (nonatomic, assign) NSInteger preloadNum;

@property (nonatomic, weak) id<ReuseScrollViewDelegate> reuseDelegate;///不能使用delegate  避免覆盖父类变量
@property (nonatomic, weak) id<ReuseScrollViewDataSource> dataSource;

/**
 根据identifier尝试获取可重用的view. (参照UITableView的用法)
 */
- (id)dequeueReusableViewWithIdentifier:(NSString *)identifier;

/**
 初始化用这个.
 */
- (instancetype)initWithFrame:(CGRect)frame;

/**
 刷新数据
 */
- (void)reloadData;

@end
