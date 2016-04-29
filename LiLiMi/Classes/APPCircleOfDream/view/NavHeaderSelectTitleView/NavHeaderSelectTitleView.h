//
//  NavHeaderTitleView.h
//  FiteamSoft_2.0
//
//  Created by wangyongbo on 15/10/28.
//  Copyright © 2015年 wangyongbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NavHeaderSelectTitleView;

@protocol NavHeaderSelectTitleViewDelegate <NSObject>

- (void)TitleView:(NavHeaderSelectTitleView *)scrollView didClickTitleButtonIndex:(NSInteger)index;

@end

@interface NavHeaderSelectTitleView : UIView

@property (nonatomic, weak) UIScrollView *titleScrollView;
/**标题字体大小  默认20号大小*/
@property (nonatomic, strong) UIFont *titleFont;

/**标题字体颜色  默认白色*/
@property (nonatomic, strong) UIColor *titleNomalColor;

/**标题字体选中颜色  默认红色*/
@property (nonatomic, strong) UIColor *titleSelctedColor;

/**底部指示条颜色  默认红色*/
@property (nonatomic, strong) UIColor *bottomLineColor;

/**传入页码索引对应到相应的按钮*/
@property (nonatomic, assign) NSInteger  pageIndex;

/**点击按钮代理*/
@property (nonatomic, weak) id<NavHeaderSelectTitleViewDelegate> delegate;

/**
 *  创建对象
 */
//- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titleArray;

- (instancetype)initWithFrame:(CGRect)frame
                       titles:(NSArray *)titleArray;

/**
 *  点亮红点
 */
- (void)badgeShowWithIndex:(NSInteger)badgeIndex;
/**
 *  隐藏红点
 */
- (void)badgeHiddenWithIndex:(NSInteger)badgeIndex;

@end
