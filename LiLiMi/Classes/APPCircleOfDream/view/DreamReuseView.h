//
//  DreamReuseView.h
//  LiLiMi
//
//  Created by wangyongbo on 16/3/14.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "ReuseScrollView.h"
@class DreamModel;

@interface DreamReuseView : ReuseView

@property (nonatomic,copy) void (^cellClickBlock)(DreamModel *);

+(instancetype)ViewWithScrollView:(ReuseScrollView *)scrollView andIdentifier:(NSString *)identifier;

@end
