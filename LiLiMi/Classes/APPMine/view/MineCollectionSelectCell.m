//
//  MineCollectionSelectCell.m
//  LiLiMi
//
//  Created by wangyongbo on 16/3/8.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "MineCollectionSelectCell.h"

@interface MineCollectionSelectCell()

@property (nonatomic,strong) UIImageView *logoImageView;

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UIImageView *arrowImageView;

@property (nonatomic,strong) UIView *bottomLimeView;

@end

@implementation MineCollectionSelectCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *logoImageView = [[UIImageView alloc]init];
        self.logoImageView = logoImageView;
        [self.contentView addSubview:logoImageView];
        
        UILabel *titleLabel = [[UILabel alloc]init];
        [titleLabel setFont:setFont(14)];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel = titleLabel;
        [self.contentView addSubview:titleLabel];
        
        UIImageView *arrowImageView = [[UIImageView alloc]init];
        self.arrowImageView = arrowImageView;
        [self.contentView addSubview:arrowImageView];
        
        UIView *bottomLimeView = [[UIView alloc]init];
        bottomLimeView.backgroundColor = [UIColor lightGrayColor];
        self.bottomLimeView = bottomLimeView;
        [self.contentView addSubview:bottomLimeView];
    }
    return self;
}

-(void)layoutSubviews
{
    [self.logoImageView setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 20 * ADAPTIVE_PROPORTION, 55 * ADAPTIVE_PROPORTION, 55 * ADAPTIVE_PROPORTION)];
    self.logoImageView.layer.masksToBounds = YES;
    self.logoImageView.layer.cornerRadius = self.logoImageView.width * 0.5;
    self.logoImageView.backgroundColor = [UIColor blueColor];
    
    [self.titleLabel setFrame:CGRectMake(105 * ADAPTIVE_PROPORTION, 20 * ADAPTIVE_PROPORTION, 420 * ADAPTIVE_PROPORTION, 55 * ADAPTIVE_PROPORTION)];
    
    [self.arrowImageView setFrame:CGRectMake(575 * ADAPTIVE_PROPORTION, 27.5 * ADAPTIVE_PROPORTION, 40 * ADAPTIVE_PROPORTION, 40 * ADAPTIVE_PROPORTION)];
    self.arrowImageView.layer.masksToBounds = YES;
    self.arrowImageView.layer.cornerRadius = self.arrowImageView.width * 0.5;
    self.arrowImageView.backgroundColor = [UIColor blueColor];
    
    [self.bottomLimeView setFrame:CGRectMake(30 * ADAPTIVE_PROPORTION, 94 * ADAPTIVE_PROPORTION, 610 * ADAPTIVE_PROPORTION, 1)];
}

-(void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    self.titleLabel.text = titleStr;
    self.isLast = NO;
}

-(void)setIsLast:(BOOL)isLast
{
    _isLast = isLast;
    self.bottomLimeView.hidden = isLast;
}

@end
