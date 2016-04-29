//
//  HomeViewController.m
//  LiLiMi
//
//  Created by wangyongbo on 16/3/3.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "HomeViewController.h"
#import "APPNavigationController.h"
#import "RegisterViewController.h"
#import "HomeHeaderSelectTitleView.h"
#import "ReuseScrollView.h"
#import "HomeReuseView.h"
@interface HomeViewController ()<HomeHeaderSelectTitleViewDelegate,
ReuseScrollViewDataSource,
ReuseScrollViewDelegate,
UIScrollViewDelegate>
{
    NSInteger selectedIndex;
}

@property (nonatomic,strong) HomeHeaderSelectTitleView *homeHeaderSelectTitleView;

@property(nonatomic,strong) ReuseScrollView *contentScrollView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //拓展边缘高度
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setupSelectTitleView];
    [self setupContentView];
}

-(void)setupSelectTitleView
{
    HomeHeaderSelectTitleView *homeHeaderSelectTitleView = [[HomeHeaderSelectTitleView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 134 * ADAPTIVE_PROPORTION) titles:@[@"普通愿望",@"自营愿望",@"情侣愿望",@"亲人愿望",@"粒友愿望"] images:@[@"ordinary_desire",@"self_desire",@"lovers__desire",@"relatives_desire",@"friends_desire"]];
    homeHeaderSelectTitleView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navigation_green"]];
    homeHeaderSelectTitleView.titleNomalColor = APPColorFromRGBA_0x(0x333333, 1);
    homeHeaderSelectTitleView.titleSelctedColor = APPColorFromRGBA_0x(0x333333, 1);
    homeHeaderSelectTitleView.titleFont = [UIFont systemFontOfSize:10];
    homeHeaderSelectTitleView.bottomLineColor = APPColorFromRGBA_0x(0xffad44, 1);
    homeHeaderSelectTitleView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    homeHeaderSelectTitleView.autoresizesSubviews = YES;
    
    homeHeaderSelectTitleView.delegate = self;
    self.homeHeaderSelectTitleView = homeHeaderSelectTitleView;
    [self.view addSubview:homeHeaderSelectTitleView];
}

-(void)setupContentView
{
    ReuseScrollView *contentScrollView = [[ReuseScrollView alloc]initWithFrame:CGRectMake(0, 134 * ADAPTIVE_PROPORTION, SCREEN_WIDTH, SCREEN_HEIGHT_WITHSTART- 64 - 49 - 134 * ADAPTIVE_PROPORTION)];
    contentScrollView.pagingEnabled = YES;
    contentScrollView.bounces = YES;
    contentScrollView.reuseDelegate = self;
    contentScrollView.dataSource = self;
    contentScrollView.delegate = self;
    contentScrollView.backgroundColor = [UIColor whiteColor];
    self.contentScrollView = contentScrollView;
    
    [contentScrollView reloadData];
    [self.view addSubview:contentScrollView];
    
}

#pragma mark TitleScrollViewDelegate
- (void)TitleView:(HomeHeaderSelectTitleView *)titleView didClickTitleButtonIndex:(NSInteger)index
{
    selectedIndex = index;
    CGPoint point = CGPointMake(index * [UIScreen mainScreen].bounds.size.width, 0);
    [self.contentScrollView setContentOffset:point animated:YES];
}


//内容滚动页数
#pragma mark - ReuseScrollViewDelegate
- (NSInteger)numberOfItemsInScrollView:(ReuseScrollView *)scrollView
{
    return 5;
}

- (UIEdgeInsets)scrollView:(ReuseScrollView *)scrollView insetForForItemAtIndex:(NSInteger)index
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentPage = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
    self.homeHeaderSelectTitleView.pageIndex = currentPage;
}

- (ReuseView *)scrollView:(ReuseScrollView *)scrollView viewForItemAtIndex:(NSInteger)index
{
    switch (index) {
        case 0:
        {
            HomeReuseView *generalReuseView = [HomeReuseView ViewWithScrollView:scrollView andIdentifier:@"generalReuseView"];
            //        [homeReuseView setCellClickBlock:^(DreamModel *dreamModel) {
            //            DreamDetailsViewController *dreamDetailsViewController = [[DreamDetailsViewController alloc]init];
            //            dreamDetailsViewController.dreamModel = dreamModel;
            //            [self.navigationController pushViewController:dreamDetailsViewController animated:YES];
            //        }];
            return generalReuseView;
        }
            break;
        case 1:
        {
            HomeReuseView *selfrunReuseView = [HomeReuseView ViewWithScrollView:scrollView andIdentifier:@"selfrunReuseView"];
            selfrunReuseView.backgroundColor = [UIColor blueColor];
            return selfrunReuseView;
        }
            break;
        case 2:
        {
            HomeReuseView *loversReuseView = [HomeReuseView ViewWithScrollView:scrollView andIdentifier:@"loversReuseView"];
            loversReuseView.backgroundColor = [UIColor blueColor];
            return loversReuseView;
        }
            break;
        case 3:
        {
            HomeReuseView *familyReuseView = [HomeReuseView ViewWithScrollView:scrollView andIdentifier:@"familyReuseView"];
            familyReuseView.backgroundColor = [UIColor blueColor];
            return familyReuseView;
        }
            break;
        case 4:
        {
            HomeReuseView *firendsReuseView = [HomeReuseView ViewWithScrollView:scrollView andIdentifier:@"firendsReuseView"];
            firendsReuseView.backgroundColor = [UIColor blueColor];
            return firendsReuseView;
        }
            break;
            
        default:
            return nil;
            break;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
