//
//  MineViewController.m
//  LiLiMi
//
//  Created by wangyongbo on 16/3/3.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "MineViewController.h"

#import "MineCollectionViewUserCell.h"
#import "MineCollectionSelectCell.h"
#import "MineCollectionMarginCell.h"

#import "RegisterViewController.h"
#import "APPNavigationController.h"

@interface MineViewController ()<
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong) UICollectionView *mainCollectionView;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //拓展边缘高度
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc ]init];
    UICollectionView *mainCollectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    mainCollectionView.backgroundColor = [UIColor whiteColor];
    
    [mainCollectionView registerClass:[MineCollectionViewUserCell class] forCellWithReuseIdentifier:@"MineCollectionViewUserCell"];
    [mainCollectionView registerClass:[MineCollectionSelectCell class] forCellWithReuseIdentifier:@"MineCollectionSelectCell"];
    [mainCollectionView registerClass:[MineCollectionMarginCell class] forCellWithReuseIdentifier:@"MineCollectionMarginCell"];
    
    mainCollectionView.delegate = self;
    mainCollectionView.dataSource = self;
    
    [mainCollectionView reloadData];
    self.mainCollectionView = mainCollectionView;
    
    [self.view addSubview:mainCollectionView];
    
    //    [self.mainCollectionView reloadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
            
        case 1:
            return 1;
            break;
        case 2:
            return 4;
            break;
            
        case 3:
            return 1;
            break;
        case 4:
            return 2;
            break;
            
        case 5:
            return 1;
            break;
        case 6:
            return 1;
            break;
            
        default:
            return 0;
            break;
    }
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 7;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            static NSString * CellIdentifier = @"MineCollectionViewUserCell";
            MineCollectionViewUserCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
            cell.userNickStr = @"点击登录，开启更多功能";
            return cell;
        }
            break;
        case 1:
        {
            static NSString * CellIdentifier = @"MineCollectionMarginCell";
            MineCollectionMarginCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
            return cell;
        }
            break;
        case 2:
        {
            static NSString * CellIdentifier = @"MineCollectionSelectCell";
            MineCollectionSelectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
            switch (indexPath.row) {
                case 0:
                    cell.titleStr = @"愿望基金";
                    break;
                    
                case 1:
                    cell.titleStr = @"账户设置";
                    break;
                    
                case 2:
                    cell.titleStr = @"绑定身份";
                    break;
                    
                case 3:
                    cell.titleStr = @"账户安全";
                    break;
                    
                case 4:
                    cell.titleStr = @"隐私";
                    cell.isLast = YES;
                    
                default:
                    break;
            }
            return cell;
        }
            break;
            
        case 3:
        {
            static NSString * CellIdentifier = @"MineCollectionMarginCell";
            MineCollectionMarginCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
            return cell;
        }
            break;
            
        case 4:
        {
            static NSString * CellIdentifier = @"MineCollectionSelectCell";
            MineCollectionSelectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
            
            switch (indexPath.row) {
                case 0:
                    cell.titleStr = @"帮助反馈";
                    break;
                    
                case 1:
                    cell.titleStr = @"关于粒粒米";
                    cell.isLast = YES;
                    break;
                    
                default:
                    break;
            }
            
            return cell;
        }
            break;
            
        case 5:
        {
            static NSString * CellIdentifier = @"MineCollectionMarginCell";
            MineCollectionMarginCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
            return cell;
        }
            break;
            
            
        case 6:
        {
            static NSString * CellIdentifier = @"MineCollectionSelectCell";
            MineCollectionSelectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
            
            switch (indexPath.row) {
                case 0:
                    cell.titleStr = @"系统设置";
                    cell.isLast = YES;
                    break;
                    
                default:
                    break;
            }
            
            return cell;
        }
            break;
            
        default:
            return nil;
            break;
            
            
    }
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return CGSizeMake(SCREEN_WIDTH, 180 * ADAPTIVE_PROPORTION);
            break;
        case 1:
            return CGSizeMake(SCREEN_WIDTH, 25 * ADAPTIVE_PROPORTION);
            break;
        case 2:
            return CGSizeMake(SCREEN_WIDTH, 95 * ADAPTIVE_PROPORTION);
            break;
        case 3:
            return CGSizeMake(SCREEN_WIDTH, 25 * ADAPTIVE_PROPORTION);
            break;
        case 4:
            return CGSizeMake(SCREEN_WIDTH, 95 * ADAPTIVE_PROPORTION);
            break;
        case 5:
            return CGSizeMake(SCREEN_WIDTH, 25 * ADAPTIVE_PROPORTION);
            break;
        case 6:
            return CGSizeMake(SCREEN_WIDTH, 95 * ADAPTIVE_PROPORTION);
            break;

        default:
            return CGSizeMake(0, 0);
            break;
    }
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    switch (section) {
//        case 2:
//            return UIEdgeInsetsMake(2 * ADAPTIVE_PROPORTION, 2 * ADAPTIVE_PROPORTION, 2 * ADAPTIVE_PROPORTION, 2 * ADAPTIVE_PROPORTION);
//            break;
            
        default:
            return UIEdgeInsetsZero;
            break;
    }
    
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            [self showLoginView];
        }
            break;
            
        default:
            break;
    }
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)showLoginView
{
    RegisterViewController *registerViewController = [[RegisterViewController alloc]init];
    registerViewController.registerStyle = RegisterLogin;
    APPNavigationController *nav = [[APPNavigationController alloc]initWithRootViewController:registerViewController];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
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
