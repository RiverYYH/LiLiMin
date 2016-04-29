//
//  HomeReuseView.m
//  LiLiMi
//
//  Created by Wxingyuan on 16/4/19.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "HomeReuseView.h"

@interface HomeReuseView()
<UITableViewDelegate,
UITableViewDataSource>
{
//    DreamModel *dreamModel;
}

@property(nonatomic,strong)UITableView *mainTableView;

@end

@implementation HomeReuseView

+(instancetype)ViewWithScrollView:(ReuseScrollView *)scrollView andIdentifier:(NSString *)identifier
{
    HomeReuseView *homeReuseView = [scrollView dequeueReusableViewWithIdentifier:identifier];
    if (!homeReuseView) {
        homeReuseView = [[HomeReuseView alloc]initWithReuseIdentifier:identifier];
    }
    return homeReuseView;
}

-(void)test
{
//    dreamModel = [[DreamModel alloc]init];
//    dreamModel.userHeaderImageUrl = @"tab_item2";
//    dreamModel.userNickName = @"高老板";
//    dreamModel.userSignature = @"我家隔壁是老王";
//    dreamModel.dreamDate = @"133天前";
//    dreamModel.dreamPicUrlArray = @[@"tab_item2",@"tab_item2",@"tab_item2",@"tab_item2",@"tab_item2",@"tab_item2",@"tab_item2",@"tab_item2",@"tab_item2"];
//    dreamModel.dreamContent = @"阿斯顿好噶后果红啊上帝哦佛啊四洞沟啥都够啊圣诞节哦赶紧哦啊伤筋动骨 i 叫阿首都机构 i 叫阿四弟哦赶紧哦 i 啥的进攻 i 决赛哦赶紧哦是阿国家队";
//    DreamCommentModel *comment1 = [[DreamCommentModel alloc]init];
//    comment1.userHeaderImageUrl = @"tab_item2";
//    comment1.userNickName = @"老王";
//    comment1.commentStr = @"我明天就搬到你隔壁了";
//    DreamCommentModel *comment2 = [[DreamCommentModel alloc]init];
//    comment2.userHeaderImageUrl = @"tab_item2";
//    comment2.userNickName = @"高老板";
//    comment2.toUserNickName = @"老王";
//    comment2.commentStr = @"不行，你还是住在小李子隔壁吧";
//    DreamCommentModel *comment3 = [[DreamCommentModel alloc]init];
//    comment3.userHeaderImageUrl = @"tab_item2";
//    comment3.userNickName = @"老王";
//    comment3.toUserNickName = @"高老板";
//    comment3.commentStr = @"呵呵～～～～～";
//    dreamModel.commentArray = @[comment1,comment2,comment3];
//    
//    dreamModel.commentCount = @"3838";
//    dreamModel.payCount = @"250";
//    dreamModel.likeCount = @"94438";
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        

        UITableView *mainTableView = [[UITableView alloc]initWithFrame:self.frame style:UITableViewStylePlain];
        self.mainTableView = mainTableView;
        
        //测试
        [self test];
        
        self.mainTableView.dataSource = self;
        self.mainTableView.delegate = self;
        
        [self setupRefresh];
        
        
        self.mainTableView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.mainTableView];
        
    }
    return self;
}

-(void)layoutSubviews
{
    [self.mainTableView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.height)];
}

//添加刷新
- (void)setupRefresh{
    //上拉刷新
    self.mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadDefalutData)];
    self.mainTableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreStatuses)];
    
    [self.mainTableView.mj_header beginRefreshing];
    
}

-(void)loadDefalutData
{
    [self.mainTableView reloadData];
    [self.mainTableView.mj_header endRefreshing];
}

-(void)loadMoreStatuses
{
    [self.mainTableView reloadData];
    [self.mainTableView.mj_footer endRefreshing];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    //config the cell
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 169 * ADAPTIVE_PROPORTION;
}

@end
