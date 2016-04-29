//
//  DreamReuseViewCell.h
//  LiLiMi
//
//  Created by wangyongbo on 16/3/14.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DreamModel.h"
#import "DreamCellBottomToolBarView.h"

@interface DreamReuseViewCell : UICollectionViewCell

@property (nonatomic,strong) DreamModel *dreamModel;

@property (nonatomic,strong) DreamCellBottomToolBarView * dreamBottomToolBarView;

@end
