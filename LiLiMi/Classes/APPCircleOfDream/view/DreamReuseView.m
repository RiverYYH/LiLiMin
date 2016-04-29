//
//  DreamReuseView.m
//  LiLiMi
//
//  Created by wangyongbo on 16/3/14.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "DreamReuseView.h"

#import "DreamReuseViewCell.h"

@interface DreamReuseView()
<UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout>
{
    DreamModel *dreamModel;
}

@property(nonatomic,strong)UICollectionView *mainCollectionView;

@end

@implementation DreamReuseView

+(instancetype)ViewWithScrollView:(ReuseScrollView *)scrollView andIdentifier:(NSString *)identifier
{
    DreamReuseView *dreamReuseView = [scrollView dequeueReusableViewWithIdentifier:identifier];
    if (!dreamReuseView) {
        dreamReuseView = [[DreamReuseView alloc]initWithReuseIdentifier:identifier];
    }
    return dreamReuseView;
}

-(void)test
{
    dreamModel = [[DreamModel alloc]init];
    dreamModel.userHeaderImageUrl = @"tab_item2";
    dreamModel.userNickName = @"高老板";
    dreamModel.userSignature = @"我家隔壁是老王";
    dreamModel.dreamDate = @"133天前";
    dreamModel.dreamPicUrlArray = @[@"tab_item2",@"tab_item2",@"tab_item2",@"tab_item2",@"tab_item2",@"tab_item2",@"tab_item2",@"tab_item2",@"tab_item2"];
    dreamModel.dreamContent = @"阿斯顿好噶后果红啊上帝哦佛啊四洞沟啥都够啊圣诞节哦赶紧哦啊伤筋动骨 i 叫阿首都机构 i 叫阿四弟哦赶紧哦 i 啥的进攻 i 决赛哦赶紧哦是阿国家队";
    DreamCommentModel *comment1 = [[DreamCommentModel alloc]init];
    comment1.userHeaderImageUrl = @"tab_item2";
    comment1.userNickName = @"老王";
    comment1.commentStr = @"我明天就搬到你隔壁了";
    DreamCommentModel *comment2 = [[DreamCommentModel alloc]init];
    comment2.userHeaderImageUrl = @"tab_item2";
    comment2.userNickName = @"高老板";
    comment2.toUserNickName = @"老王";
    comment2.commentStr = @"不行，你还是住在小李子隔壁吧";
    DreamCommentModel *comment3 = [[DreamCommentModel alloc]init];
    comment3.userHeaderImageUrl = @"tab_item2";
    comment3.userNickName = @"老王";
    comment3.toUserNickName = @"高老板";
    comment3.commentStr = @"呵呵～～～～～";
    dreamModel.commentArray = @[comment1,comment2,comment3];
    
    dreamModel.commentCount = @"3838";
    dreamModel.payCount = @"250";
    dreamModel.likeCount = @"94438";
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc ]init];
        self.mainCollectionView = [[UICollectionView alloc]initWithFrame:self.frame collectionViewLayout:flowLayout];
        
        //测试
        [self test];
        
        [self.mainCollectionView registerClass:[DreamReuseViewCell class] forCellWithReuseIdentifier:@"DreamReuseViewCell"];
        
        self.mainCollectionView.dataSource = self;
        self.mainCollectionView.delegate = self;
        
        [self setupRefresh];

        
        self.mainCollectionView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.mainCollectionView];
        
    }
    return self;
}

-(void)layoutSubviews
{
    [self.mainCollectionView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.height)];
}

//添加刷新
- (void)setupRefresh{
    //上拉刷新
    self.mainCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadDefalutData)];
    self.mainCollectionView.mj_footer = [MJRefreshBackFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreStatuses)];
    
        [self.mainCollectionView.mj_header beginRefreshing];
    
}

-(void)loadDefalutData
{
    [self.mainCollectionView reloadData];
    [self.mainCollectionView.mj_header endRefreshing];
}

-(void)loadMoreStatuses
{
    [self.mainCollectionView reloadData];
    [self.mainCollectionView.mj_footer endRefreshing];
}

#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DreamReuseViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DreamReuseViewCell" forIndexPath:indexPath];
    cell.dreamModel = dreamModel;
    
    [cell.dreamBottomToolBarView setCommentBlock:^{
        APPLog(@"－－－点击了bottomToolBar的评论－－－");
    }];
    [cell.dreamBottomToolBarView setPayBlock:^{
        APPLog(@"－－－点击了bottomToolBar的支付－－－");
    }];
    [cell.dreamBottomToolBarView setLikeBlock:^{
        APPLog(@"－－－点击了bottomToolBar的喜欢－－－");
    }];
    
    return cell;
    
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    DreamFrame *dreamFrame = [[DreamFrame alloc]init];
    dreamFrame.dreamModel = dreamModel;
    
    return CGSizeMake(SCREEN_WIDTH,dreamFrame.allFrameHight);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.cellClickBlock(dreamModel);
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


@end
