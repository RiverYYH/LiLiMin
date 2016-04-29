//
//  DreamViewDetailsViewController.m
//  LiLiMi
//
//  Created by wangyongbo on 16/3/16.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "DreamDetailsViewController.h"
#import "DreamDetailsCell.h"

@interface DreamDetailsViewController ()
<UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *mainCollectionView;

@end

@implementation DreamDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"详情";
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc ]init];
    self.mainCollectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    
    [self.mainCollectionView registerClass:[DreamDetailsCell class] forCellWithReuseIdentifier:@"DreamDetailsCell"];
    
    self.mainCollectionView.dataSource = self;
    self.mainCollectionView.delegate = self;
    
    [self setupRefresh];
    
    
    self.mainCollectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainCollectionView];
}

-(void)layoutSubviews
{
    [self.mainCollectionView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.height)];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DreamDetailsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DreamDetailsCell" forIndexPath:indexPath];
    cell.dreamModel = self.dreamModel;
    
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
    dreamFrame.dreamModel = self.dreamModel;
    
    return CGSizeMake(SCREEN_WIDTH,dreamFrame.dreamFrameHight);
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
    //    Items *dynamic = [self.dynamicArray objectAtIndex:indexPath.row];
    //    self.dynamicDetailsBlock(dynamic);
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


@end
