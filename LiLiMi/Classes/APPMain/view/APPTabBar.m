//
//  APPTabBar.m
//
//  Created by wangyongbo on 15/10/15.
//  Copyright (c) 2015年 wangyongbo. All rights reserved.
//

#import "APPTabBar.h"
#import "APPTabBarButton.h"
#import "APPTabBarMainButton.h"

@interface APPTabBar()<UIActionSheetDelegate,UIActionSheetDelegate>

@property (nonatomic, weak) APPTabBarButton *selectedButton;

@property (nonatomic, weak) APPTabBarMainButton *centerButton;

@end

@implementation APPTabBar

- (NSMutableArray *)btnArray
{
    if (_btnArray == nil) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}

#pragma mark 添加子控件
- (void)addTabBarButtonWithItem:(UITabBarItem *)item tag:(int)tag
{
    //创建按钮
    APPTabBarButton *button = [[APPTabBarButton alloc]init];
    [self addSubview:button];
    
    [self.btnArray addObject:button];
    
    //设置数据
    button.item = item;
    button.tag=tag;
    
    //监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //默认选中第一个按钮
    if (self.btnArray.count == 1) {
        [self buttonClick:button];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //添加主按钮
        APPTabBarMainButton *centerButton = [APPTabBarMainButton buttonWithType:UIButtonTypeCustom];
        [centerButton setBackgroundImage:[UIImage imageNamed:@"tab_item2"] forState:UIControlStateNormal];
        [centerButton setBackgroundImage:[UIImage imageNamed:@"tab_item2"] forState:UIControlStateHighlighted];
        [centerButton setTitle:@"发布" forState:UIControlStateNormal];
        [centerButton addTarget:self action:@selector(clickMainButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:centerButton];
        self.centerButton = centerButton;
    }
    return self;
}

#pragma mark 配置子控件位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //设置主按钮的位置
    self.centerButton.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.3);
    self.centerButton.bounds = CGRectMake(0, 0, self.centerButton.currentBackgroundImage.size.width ,self.frame.size.height * 1.4);
    //按钮的frame
    CGFloat buttonH = self.frame.size.height;
    
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonY = 0;
    
    for (int index = 0; index<self.btnArray.count; index++) {
        // 1.取出按钮
        APPTabBarButton *button = self.btnArray[index];
        
        // 2.设置按钮的frame
        CGFloat buttonX = index * buttonW;

//        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        if (index > 1) {
            buttonX += buttonW;
        }
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        

        // 3.绑定tag
        button.tag = index;
    }
}
-(void)setSelectedItem:(NSInteger)tag
{
    for (APPTabBarButton *btn in [self subviews]) {
        if (btn.tag==tag) {
            [self buttonClick:btn];
        }
    }
}
#pragma mark 按钮点击事件
- (void)buttonClick:(APPTabBarButton *)button
{
    //通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:(int)self.selectedButton.tag to:(int)button.tag];
    }
    //设置按钮的状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

- (void)clickMainButton:(UIButton *)button
{
    APPLog(@"主按钮");
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"愿望1",@"愿望2", nil];
    [sheet showInView:self];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        APPLog(@"发愿望1");
    }
    else
        APPLog(@"发愿望2");
}
@end
