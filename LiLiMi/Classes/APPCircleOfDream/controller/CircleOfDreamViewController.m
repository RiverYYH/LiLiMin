//
//  CircleOfDreamViewController.m
//  LiLiMi
//
//  Created by wangyongbo on 16/3/3.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "CircleOfDreamViewController.h"

#import "NavHeaderSelectTitleView.h"
#import "ReuseScrollView.h"
#import "DreamReuseView.h"

#import "DreamDetailsViewController.h"

@interface CircleOfDreamViewController ()
<NavHeaderSelectTitleViewDelegate,
ReuseScrollViewDataSource,
ReuseScrollViewDelegate,
UIScrollViewDelegate>
{
    NSInteger selectedIndex;
}
@property (nonatomic,strong) NavHeaderSelectTitleView *navHeaderSelectTitleView;

@property(nonatomic,strong) ReuseScrollView *contentScrollView;

@end

@implementation CircleOfDreamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //拓展边缘高度
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNavSelectTitleView];
    [self setupContentView];
}

-(void)setupNavSelectTitleView
{
    NavHeaderSelectTitleView *navHeaderSelectTitleView = [[NavHeaderSelectTitleView alloc]initWithFrame:CGRectMake(0, 0, 380 * SCREEN_WIDTH / IP6_WIDTH, 44) titles:@[@"愿望圈",@"好友圈"]];
    navHeaderSelectTitleView.backgroundColor = [UIColor clearColor];
    navHeaderSelectTitleView.titleNomalColor = APPColorFromRGBA_0x(0x333333, 1);
    navHeaderSelectTitleView.titleSelctedColor = APPColorFromRGBA_0x(0x333333, 1);
    navHeaderSelectTitleView.titleFont = [UIFont systemFontOfSize:18];
    
    navHeaderSelectTitleView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    navHeaderSelectTitleView.autoresizesSubviews = YES;
    
    navHeaderSelectTitleView.delegate = self;
    self.navHeaderSelectTitleView = navHeaderSelectTitleView;
    
    self.navigationItem.titleView = navHeaderSelectTitleView;
}

-(void)setupContentView
{
    ReuseScrollView *contentScrollView = [[ReuseScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT_WITHSTART- 64 - 49)];
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
- (void)TitleView:(NavHeaderSelectTitleView *)scrollView didClickTitleButtonIndex:(NSInteger)index
{
    selectedIndex = index;
    CGPoint point = CGPointMake(index * [UIScreen mainScreen].bounds.size.width, 0);
    [self.contentScrollView setContentOffset:point animated:YES];
}


//内容滚动页数
#pragma mark - ReuseScrollViewDelegate
- (NSInteger)numberOfItemsInScrollView:(ReuseScrollView *)scrollView
{
    return 2;
}

- (UIEdgeInsets)scrollView:(ReuseScrollView *)scrollView insetForForItemAtIndex:(NSInteger)index
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentPage = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
    self.navHeaderSelectTitleView.pageIndex = currentPage;
}

- (ReuseView *)scrollView:(ReuseScrollView *)scrollView viewForItemAtIndex:(NSInteger)index
{
    if (index == 0) {
        DreamReuseView *dreamReuseView = [DreamReuseView ViewWithScrollView:scrollView andIdentifier:@"DreamReuseView"];
        [dreamReuseView setCellClickBlock:^(DreamModel *dreamModel) {
            DreamDetailsViewController *dreamDetailsViewController = [[DreamDetailsViewController alloc]init];
            dreamDetailsViewController.dreamModel = dreamModel;
            [self.navigationController pushViewController:dreamDetailsViewController animated:YES];
        }];
        return dreamReuseView;
    }
    else
    {
        DreamReuseView *friendReuseView = [DreamReuseView ViewWithScrollView:scrollView andIdentifier:@"FriendReuseView"];
        friendReuseView.backgroundColor = [UIColor blueColor];
        return friendReuseView;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
