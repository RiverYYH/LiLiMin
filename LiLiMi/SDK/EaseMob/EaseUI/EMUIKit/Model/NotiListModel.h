//
//  SystemNotiListModel.h
//  LiLiMi
//
//  Created by 高云 on 16/4/19.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotiListModel : NSObject
//标题
@property (strong, nonatomic) NSString *title;
//头像
@property (strong, nonatomic) UIImage *avatarImage;
//对话内容
@property (strong, nonatomic) NSString *detail;
//时间
@property (strong, nonatomic) NSString *timestamp;

@end
