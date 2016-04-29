//
//  NavHeaderTitleView.m
//  FiteamSoft_2.0
//
//  Created by wangyongbo on 15/10/28.
//  Copyright © 2015年 wangyongbo. All rights reserved.
//

#import "NavHeaderSelectTitleView.h"
#import "RedBadge.h"

@interface NavHeaderSelectTitleView()
{
    NSArray *_titleArray;
    
    NSInteger index;
}

@property (nonatomic, strong) NSMutableArray *buttonArray;

@property (nonatomic, strong) NSMutableArray *badgeArray;

@property (nonatomic, weak) UIButton *leftButton;

@property (nonatomic, weak) UIButton *rightButton;

@property (nonatomic, weak) UIView *bottomLine;

@property (nonatomic, weak) UIButton *selectedButton;

@end

@implementation NavHeaderSelectTitleView


- (void)badgeShowWithIndex:(NSInteger)badgeIndex
{
    if (badgeIndex < self.badgeArray.count) {
        RedBadge *badgeBtn = self.badgeArray[badgeIndex];
        if (index==badgeIndex) {
            return;
        }
        badgeBtn.hidden = NO;
    }
}

- (void)badgeHiddenWithIndex:(NSInteger)badgeIndex
{
    if (badgeIndex < self.badgeArray.count) {
        RedBadge *badgeBtn = self.badgeArray[badgeIndex];
        badgeBtn.hidden = YES;
    }
}
- (NSMutableArray *)buttonArray
{
    if (_buttonArray == nil) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}

- (NSMutableArray *)badgeArray
{
    if (_badgeArray == nil) {
        _badgeArray = [NSMutableArray array];
    }
    return _badgeArray;
}

- (instancetype)initWithFrame:(CGRect)frame
                       titles:(NSArray *)titleArray
{
    if (self = [super initWithFrame:frame]) {
        _titleArray = titleArray;
        
        //添加scrollView
        UIScrollView *titleScrollView = [[UIScrollView alloc]init];
        titleScrollView.showsHorizontalScrollIndicator = NO;
        titleScrollView.scrollsToTop = NO;
        [self addSubview:titleScrollView];
        self.titleScrollView = titleScrollView;
        
        //创建底部指示条
        UIView *bottomLine = [[UIView alloc]init];
        bottomLine.backgroundColor = self.bottomLineColor?self.bottomLineColor:[UIColor blackColor];
        [titleScrollView addSubview:bottomLine];
        self.bottomLine = bottomLine;
        
        //添加菜单按钮
        for (int i = 0; i < titleArray.count; i ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:titleArray[i] forState:UIControlStateNormal];
            button.titleLabel.font = self.titleFont?self.titleFont:setFont(20);
            [button setTitleColor:self.titleNomalColor?self.titleNomalColor:[UIColor whiteColor]forState:UIControlStateNormal];
            [button setTitleColor:self.titleSelctedColor?self.titleSelctedColor:[UIColor redColor]forState:UIControlStateSelected];
            [button addTarget:self action:@selector(clickTitleButton:) forControlEvents:UIControlEventTouchDown];
            [self.titleScrollView addSubview:button];
            [self.buttonArray addObject:button];
            //红点
            RedBadge *badgeButton=[[RedBadge alloc]initWithFrame:CGRectMake(0, 0, 8*ADAPTIVE_PROPORTION, 8*ADAPTIVE_PROPORTION)];
            badgeButton.badgeValue = @"";
            badgeButton.hidden = YES;
            [self.titleScrollView addSubview:badgeButton];
            [self.badgeArray addObject:badgeButton];
        }

        //        [self clickTitleButton:(UIButton *)self.buttonArray.firstObject];
        index = 0;
        
//        UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH*100/IP6_WIDTH  , frame.size.width, SCREEN_WIDTH*14/IP6_WIDTH)];
//        bottomView.backgroundColor = def_TableView_Cell_LineColor;
//        [self addSubview:bottomView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //设置scrollView的位置
    self.titleScrollView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    for(int i = 0 ; i <self.buttonArray.count ; i++)
    {
        UIButton *btn = self.buttonArray[i];
        btn.frame = CGRectMake(0, 0, 80, 33);
        btn.backgroundColor = [UIColor clearColor];
        btn.center = CGPointMake(self.bounds.size.width / 4 + self.bounds.size.width / 2 * i , self.bounds.size.height / 2);
        
        RedBadge *badgeBtn = self.badgeArray[i];
        [badgeBtn setMj_origin:CGPointMake(CGRectGetMaxX(btn.frame) - 32 * ADAPTIVE_PROPORTION , 10*ADAPTIVE_PROPORTION)];
    }
    //设置滚动条的内容尺寸
//    UIButton *lastbtn = self.buttonArray.lastObject;
    self.titleScrollView.contentSize = self.titleScrollView.frame.size;

    self.titleScrollView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);

    //设置底部指示条的位置
    UIButton *firstbtn = self.buttonArray.firstObject;
    CGRect rect = firstbtn.frame;
    rect.origin.y = 40;
    rect.size.width = firstbtn.width - 18;
    rect.origin.x = firstbtn.center.x - 31;
    rect.size.height = 4;
    self.bottomLine.frame = rect;
//    self.bottomLine.layer.cornerRadius = rect.size.height / 2;
}

- (void)clickLeftButton:(UIButton *)button
{
    self.rightButton.hidden = NO;
    if (index > 0 ) {
        index --;
        [self clickTitleButton:self.buttonArray[index]];
        if (index == 0) {
            button.hidden = YES;
        }
    }
}

- (void)clickRightButton:(UIButton *)button
{
    self.leftButton.hidden = NO;
    if (index < self.buttonArray.count) {
        index ++;
        [self clickTitleButton:self.buttonArray[index]];
        if (index == self.buttonArray.count -1) {
            button.hidden = YES;
        }
    }
}

- (void)clickTitleButton:(UIButton *)button
{
    [self.titleScrollView scrollRectToVisible:button.frame animated:YES];
    index = [self.buttonArray indexOfObject:button];
    RedBadge *redBadge = self.badgeArray[index];
    redBadge.hidden = YES;
    if (index == 0) {
        self.leftButton.hidden = YES;
        self.rightButton.hidden = NO;
    }
    else if(index == self.buttonArray.count - 1 ){
        self.rightButton.hidden = YES;
        self.leftButton.hidden = NO;
    }
    else{
        self.leftButton.hidden = NO;
        self.rightButton.hidden = NO;
    }
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
    //移动指示条位置
    [UIView animateWithDuration:0.2 animations:^{
        self.bottomLine.centerX = button.center.x;
    }];
    if ([self.delegate respondsToSelector:@selector(TitleView:didClickTitleButtonIndex:)]) {
        [self.delegate TitleView:self didClickTitleButtonIndex:index];
    }
}

- (void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    for (UIButton *btn in self.buttonArray) {
        btn.titleLabel.font = titleFont;
    }
}

- (void)setTitleNomalColor:(UIColor *)titleNomalColor
{
    _titleNomalColor = titleNomalColor;
    for (UIButton *btn in self.buttonArray) {
        [btn setTitleColor:titleNomalColor forState:UIControlStateNormal];
    }
}

- (void)setTitleSelctedColor:(UIColor *)titleSelctedColor
{
    _titleSelctedColor = titleSelctedColor;
    for (UIButton *btn in self.buttonArray) {
        [btn setTitleColor:titleSelctedColor forState:UIControlStateSelected];
    }
}

- (void)setBottomLineColor:(UIColor *)bottomLineColor
{
    _bottomLineColor = bottomLineColor;
    self.bottomLine.backgroundColor = bottomLineColor;
}

- (void)setPageIndex:(NSInteger)pageIndex
{
    [self clickTitleButton:self.buttonArray[pageIndex]];
}


@end
