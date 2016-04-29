//
//  UIView+LayoutMethods.m
//  TmallClient4iOS-Prime
//
//  Created by casa on 14/12/8.
//  Copyright (c) 2014年 casa. All rights reserved.
//

#import "UIView+LayoutMethods.h"

@implementation UIView (LayoutMethods)

// coordinator getters
//获取高度
- (CGFloat)height
{
    return self.frame.size.height;
}
//获取宽度
- (CGFloat)width
{
    return self.frame.size.width;
}
//获取x坐标
- (CGFloat)x
{
    return self.frame.origin.x;
}
//获取y坐标
- (CGFloat)y
{
    return self.frame.origin.y;
}
//设置x坐标
- (void)setX:(CGFloat)x
{
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}
//设置y坐标
- (void)setY:(CGFloat)y
{
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}
//获取size
- (CGSize)size
{
    return self.frame.size;
}
//获取origin
- (CGPoint)origin
{
    return self.frame.origin;
}
//获取centerX
- (CGFloat)centerX
{
    return self.center.x;
}
//获取centerY
- (CGFloat)centerY
{
    return self.center.y;
}
//获取bottom
- (CGFloat)bottom
{
    return self.frame.size.height + self.frame.origin.y;
}
//获取right
- (CGFloat)right
{
    return self.frame.size.width + self.frame.origin.x;
}
//获取x
- (CGFloat)left
{
    return self.frame.origin.x;
}
//设置x
- (void)setLeft:(CGFloat)left
{
    self.x = left;
}
//设置y
- (void)setTop:(CGFloat)top
{
    self.y = top;
}
//获取y
- (CGFloat)top
{
    return self.frame.origin.y;
}

// 设置height
- (void)setHeight:(CGFloat)height
{
    CGRect newFrame = CGRectMake(self.x, self.y, self.width, height);
    self.frame = newFrame;
}
//设置和view等高
- (void)heightEqualToView:(UIView *)view
{
    self.height = view.height;
}

//设置width
- (void)setWidth:(CGFloat)width
{
    CGRect newFrame = CGRectMake(self.x, self.y, width, self.height);
    self.frame = newFrame;
}
// 设置和view等高
- (void)widthEqualToView:(UIView *)view
{
    self.width = view.width;
}

// 设置centerX
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = CGPointMake(self.centerX, self.centerY);
    center.x = centerX;
    self.center = center;
}
//设置centerY
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = CGPointMake(self.centerX, self.centerY);
    center.y = centerY;
    self.center = center;
}
//设置和view等centerX
- (void)centerXEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.topSuperView];
    CGPoint centerPoint = [self.topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.centerX = centerPoint.x;
}
//设置和view等centerY
- (void)centerYEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.topSuperView];
    CGPoint centerPoint = [self.topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.centerY = centerPoint.y;
}

//设置y比view.y高多少
- (void)top:(CGFloat)top FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.y = floorf(newOrigin.y + top + view.height);
}
//设置比view.bottom高多少
- (void)bottom:(CGFloat)bottom FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.y = newOrigin.y - bottom - self.height;
}
//设置到view左边的距离
- (void)left:(CGFloat)left FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.x = newOrigin.x - left - self.width;
}
//设置到view右边的距离
- (void)right:(CGFloat)right FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.x = newOrigin.x + right + view.width;
}
//按比例来算到顶部的距离
- (void)topRatio:(CGFloat)top FromView:(UIView *)view screenType:(UIScreenType)screenType
{
    CGFloat topRatio = top / screenType;
    CGFloat topValue = topRatio * self.superview.width;
    [self top:topValue FromView:view];
}
//按比例来算到底部的距离
- (void)bottomRatio:(CGFloat)bottom FromView:(UIView *)view screenType:(UIScreenType)screenType
{
    CGFloat bottomRatio = bottom / screenType;
    CGFloat bottomValue = bottomRatio * self.superview.width;
    [self bottom:bottomValue FromView:view];
}
//按比例来算到左边的距离
- (void)leftRatio:(CGFloat)left FromView:(UIView *)view screenType:(UIScreenType)screenType
{
    CGFloat leftRatio = left / screenType;
    CGFloat leftValue = leftRatio * self.superview.width;
    [self left:leftValue FromView:view];
}
//按比例来算到右边的距离
- (void)rightRatio:(CGFloat)right FromView:(UIView *)view screenType:(UIScreenType)screenType
{
    CGFloat rightRatio = right / screenType;
    CGFloat rightValue = rightRatio * self.superview.width;
    [self right:rightValue FromView:view];
}
//向上移动（或者增加高度）
- (void)topInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.height = self.y - top + self.height;
    }
    self.y = top;
}
//向下移动（或者增加高度）
- (void)bottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.height = self.superview.height - bottom - self.y;
    } else {
        self.y = self.superview.height - self.height - bottom;
    }
}
//向左移动（或者增加宽度）
- (void)leftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.width = self.x - left + self.superview.width;
    }
    self.x = left;
}
//向右移动（或者增加宽度）
- (void)rightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.width = self.superview.width - right - self.x;
    } else {
        self.x = self.superview.width - self.width - right;
    }
}
//按比例向上移动（或者增加高度）
- (void)topRatioInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    CGFloat topRatio = top / screenType;
    CGFloat topValue = topRatio * self.superview.width;
    [self topInContainer:topValue shouldResize:shouldResize];
}
//按比例向下移动（或者增加高度）
- (void)bottomRatioInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    CGFloat bottomRatio = bottom / screenType;
    CGFloat bottomValue = bottomRatio * self.superview.width;
    [self bottomInContainer:bottomValue shouldResize:shouldResize];
}
//按比例向左移动（或者增加宽度）
- (void)leftRatioInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    CGFloat leftRatio = left / screenType;
    CGFloat leftValue = leftRatio * self.superview.width;
    [self leftInContainer:leftValue shouldResize:shouldResize];
}
//按比例向右移动（或者增加宽度）
- (void)rightRatioInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    CGFloat rightRatio = right / screenType;
    CGFloat rightValue = rightRatio * self.superview.width;
    [self rightInContainer:rightValue shouldResize:shouldResize];
}
//设置和view顶部齐平
- (void)topEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.y = newOrigin.y;
}
//设置和view底部齐平
- (void)bottomEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    self.y = newOrigin.y + view.height - self.height;
}
//设置和view左对齐
- (void)leftEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.x = newOrigin.x;
}
//设置和view右对齐
- (void)rightEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.x = newOrigin.x + view.width - self.width;
}

//自动计算布局到view的 top ，bottom ，left ，right
- (void)topEqualToView:(UIView *)view top:(CGFloat)top
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.y = newOrigin.y+top;
}

- (void)bottomEqualToView:(UIView *)view bottom:(CGFloat)bottom
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.y = newOrigin.y + view.height - self.height - bottom;
}

- (void)leftEqualToView:(UIView *)view left:(CGFloat)left
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.x = newOrigin.x + left;
}

- (void)rightEqualToView:(UIView *)view right:(CGFloat)right
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.x = newOrigin.x + view.width - self.width - right;
}
//自动计算在两个横向控件之间的view的宽度
-(void)right:(CGFloat)right toLeftView:(UIView*)toLeftView left:(CGFloat)left toRightView:(UIView*)toRightView
{
    [self setX:(toLeftView.right+right)];
    [self setWidth:(toRightView.x-self.x-left)];
}
//自动计算在两个纵向控件之间的view的高度
-(void)top:(CGFloat)top toTopView:(UIView*)toTopView bottom:(CGFloat)bottom toBottomView:(UIView*)toBottomView
{
    [self setY:(toTopView.bottom+top)];
    [self setHeight:(toBottomView.y-self.y-bottom)];
}
// 两个控件组合水平设置居中
-(void)btWidth:(CGFloat)btWidth rightView:(UIView*)rightView fullWidth:(CGFloat)fullWidth
{
    CGFloat leftx=(fullWidth-btWidth-self.width-rightView.width)/2;
    [self setX:leftx];
    [rightView right:btWidth FromView:self];
}
// 两个控件组合垂直设置居中
-(void)btHeight:(CGFloat)btHeight bottomView:(UIView*)bottomView fullHeight:(CGFloat)fullHeight
{
    CGFloat topx=(fullHeight-btHeight-self.height-bottomView.height)/2;
    [self setY:topx];
    [bottomView top:btHeight FromView:self];
}
-(CGFloat)getWidtFromRightView:(UIView*)rightView
{
    CGFloat Width=rightView.x-self.right;
    return Width;
}
// size
- (void)setSize:(CGSize)size
{
    self.frame = CGRectMake(self.x, self.y, size.width, size.height);
}

- (void)sizeEqualToView:(UIView *)view
{
    self.frame = CGRectMake(self.x, self.y, view.width, view.height);
}

// imbueset
- (void)fillWidth
{
    self.width = self.superview.width;
}

- (void)fillHeight
{
    self.height = self.superview.height;
}

- (void)fill
{
    self.frame = CGRectMake(0, 0, self.superview.width, self.superview.height);
}

- (UIView *)topSuperView
{
    UIView *topSuperView = self.superview;
    
    if (topSuperView == nil) {
        topSuperView = self;
    } else {
        while (topSuperView.superview) {
            topSuperView = topSuperView.superview;
        }
    }
    
    return topSuperView;
}

@end
