//
//  MineCollectionViewUserCell.m
//  LiLiMi
//
//  Created by wangyongbo on 16/3/4.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "MineCollectionViewUserCell.h"

@interface MineCollectionViewUserCell()

@property (nonatomic,strong) UIButton *userHeaderButton;

@property (nonatomic,strong) UILabel *userNickLabel;

@end

@implementation MineCollectionViewUserCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIButton *userHeaderButton = [[UIButton alloc]init];
        [self.contentView addSubview:userHeaderButton];
        self.userHeaderButton = userHeaderButton;
        
        UILabel *userNickLabel = [[UILabel alloc]init];
        [userNickLabel setFont:setFont(14)];
        userNickLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:userNickLabel];
        self.userNickLabel = userNickLabel;
        
    }
    return self;
}

-(void)layoutSubviews
{
    [self.userHeaderButton setFrame:CGRectMake(35 * ADAPTIVE_PROPORTION, 30 * ADAPTIVE_PROPORTION, 120 * ADAPTIVE_PROPORTION, 120 * ADAPTIVE_PROPORTION)];
    self.userHeaderButton.layer.masksToBounds = YES;
    self.userHeaderButton.layer.cornerRadius = 0.5 * self.userHeaderButton.width;
    self.userHeaderButton.backgroundColor = [UIColor blueColor];
    
    [self.userNickLabel setFrame:CGRectMake(180 * ADAPTIVE_PROPORTION, 30 * ADAPTIVE_PROPORTION, 400 * ADAPTIVE_PROPORTION, 120 * ADAPTIVE_PROPORTION)];
}

-(void)setUserNickStr:(NSString *)userNickStr
{
    _userNickStr = userNickStr;
    self.userNickLabel.text = userNickStr;
}

@end
