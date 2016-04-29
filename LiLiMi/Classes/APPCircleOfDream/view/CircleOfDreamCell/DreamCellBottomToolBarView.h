//
//  DreamCellBottomToolBarView.h
//  LiLiMi
//
//  Created by wangyongbo on 16/3/15.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DreamModel.h"

@interface DreamCellBottomToolBarView : UIView

@property (nonatomic,copy) void (^commentBlock)();

@property (nonatomic,copy) void (^payBlock)();

@property (nonatomic,copy) void (^likeBlock)();

@property (nonatomic,strong) DreamModel *dreamModel;

@end
