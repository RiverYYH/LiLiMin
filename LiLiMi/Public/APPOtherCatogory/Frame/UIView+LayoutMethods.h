//
//  UIView+LayoutMethods.h
//  TmallClient4iOS-Prime
//
//  Created by casa on 14/12/8.
//  Copyright (c) 2014年 casa. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define SCREEN_WITHOUT_STATUS_HEIGHT (SCREEN_HEIGHT - [[UIApplication sharedApplication] statusBarFrame].size.height)

typedef CGFloat UIScreenType;

static UIScreenType UIScreenType_iPhone6 = 375.0f;

@interface UIView (LayoutMethods)

// coordinator getters
- (CGFloat)height;
- (CGFloat)width;
- (CGFloat)x;
- (CGFloat)y;
- (CGSize)size;
- (CGPoint)origin;
- (CGFloat)centerX;
- (CGFloat)centerY;

- (CGFloat)left;
- (CGFloat)top;
- (CGFloat)bottom;
- (CGFloat)right;

- (void)setX:(CGFloat)x;
- (void)setLeft:(CGFloat)left;
- (void)setY:(CGFloat)y;
- (void)setTop:(CGFloat)top;

// height
- (void)setHeight:(CGFloat)height;
- (void)heightEqualToView:(UIView *)view;

// width
- (void)setWidth:(CGFloat)width;
- (void)widthEqualToView:(UIView *)view;

// center
- (void)setCenterX:(CGFloat)centerX;
- (void)setCenterY:(CGFloat)centerY;
- (void)centerXEqualToView:(UIView *)view;
- (void)centerYEqualToView:(UIView *)view;

// top, bottom, left, right
- (void)top:(CGFloat)top FromView:(UIView *)view;
- (void)bottom:(CGFloat)bottom FromView:(UIView *)view;
- (void)left:(CGFloat)left FromView:(UIView *)view;
- (void)right:(CGFloat)right FromView:(UIView *)view;

- (void)topRatio:(CGFloat)top FromView:(UIView *)view screenType:(UIScreenType)screenType;
- (void)bottomRatio:(CGFloat)bottom FromView:(UIView *)view screenType:(UIScreenType)screenType;
- (void)leftRatio:(CGFloat)left FromView:(UIView *)view screenType:(UIScreenType)screenType;
- (void)rightRatio:(CGFloat)right FromView:(UIView *)view screenType:(UIScreenType)screenType;

- (void)topInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize;
- (void)bottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize;
- (void)leftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize;
- (void)rightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize;

- (void)topRatioInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType;
- (void)bottomRatioInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType;
- (void)leftRatioInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType;
- (void)rightRatioInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType;

- (void)topEqualToView:(UIView *)view;
- (void)bottomEqualToView:(UIView *)view;
- (void)leftEqualToView:(UIView *)view;
- (void)rightEqualToView:(UIView *)view;

- (void)topEqualToView:(UIView *)view top:(CGFloat)top;
- (void)bottomEqualToView:(UIView *)view bottom:(CGFloat)bottom;
- (void)leftEqualToView:(UIView *)view left:(CGFloat)left;
- (void)rightEqualToView:(UIView *)view right:(CGFloat)right;
//自动计算在两个横向控件之间的view的宽度
-(void)right:(CGFloat)right toLeftView:(UIView*)toLeftView left:(CGFloat)left toRightView:(UIView*)toRightView;
//自动计算在两个纵向控件之间的view的高度
-(void)top:(CGFloat)top toTopView:(UIView*)toTopView bottom:(CGFloat)bottom toBottomView:(UIView*)toBottomView;
//两个view居中
-(void)btWidth:(CGFloat)btWidth rightView:(UIView*)rightView fullWidth:(CGFloat)fullWidth;
// 两个控件组合垂直设置居中
-(void)btHeight:(CGFloat)btHeight bottomView:(UIView*)bottomView fullHeight:(CGFloat)fullHeight;
//获取两个view之间的距离

-(CGFloat)getWidtFromRightView:(UIView*)rightView;
// size
- (void)setSize:(CGSize)size;
- (void)sizeEqualToView:(UIView *)view;

// imbueset
- (void)fillWidth;
- (void)fillHeight;
- (void)fill;

- (UIView *)topSuperView;

@end

@protocol LayoutProtocol
@required
// put your layout code here
- (void)calculateLayout;
@end
