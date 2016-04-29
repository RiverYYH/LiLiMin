//
//  HomeReuseView.h
//  LiLiMi
//
//  Created by Wxingyuan on 16/4/19.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "ReuseScrollView.h"

@interface HomeReuseView :  ReuseView

//@property (nonatomic,copy) void (^cellClickBlock)(DreamModel *);

+(instancetype)ViewWithScrollView:(ReuseScrollView *)scrollView andIdentifier:(NSString *)identifier;

@end
