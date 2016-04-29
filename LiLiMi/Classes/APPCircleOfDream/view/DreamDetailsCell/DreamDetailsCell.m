//
//  DreamDetailsCell.m
//  LiLiMi
//
//  Created by wangyongbo on 16/3/16.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "DreamDetailsCell.h"

@interface DreamDetailsCell()

@property (nonatomic,strong) APPImageView *userHeaderImageView;

@property (nonatomic,strong) UILabel *userNickNameLable;

@property (nonatomic,strong) UILabel *userSignatureLabel;

@property (nonatomic,strong) UILabel *dreamDateLabel;

@property (nonatomic,strong) NSArray *dreamPicImageViewArray;

@property (nonatomic,strong) UILabel *dreamContentLabel;

@property (nonatomic,strong) UIView *bottomLineView;

@end

@implementation DreamDetailsCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupControl];
    }
    return self;
}

-(void)setupControl
{
    APPImageView *userHeaderImageView = [[APPImageView alloc]init];
    userHeaderImageView.imageViewStyle = APPImageViewUserHeader;
    self.userHeaderImageView = userHeaderImageView;
    [self.contentView addSubview:userHeaderImageView];
    
    UILabel *userNickNameLable = [[UILabel alloc]init];
    userNickNameLable.font = setFont(13);
    userNickNameLable.textColor = APPColorFromRGBA_0x(0x000000, 1);
    userNickNameLable.textAlignment = NSTextAlignmentLeft;
    self.userNickNameLable = userNickNameLable;
    [self.contentView addSubview:userNickNameLable];
    
    UILabel *userSignatureLabel = [[UILabel alloc]init];
    userSignatureLabel.font = setFont(12);
    userSignatureLabel.textColor = APPColorFromRGBA_0x(0xa5a5a5, 1);
    userSignatureLabel.textAlignment = NSTextAlignmentLeft;
    self.userSignatureLabel = userSignatureLabel;
    [self.contentView addSubview:userSignatureLabel];
    
    UILabel *dreamDateLabel = [[UILabel alloc]init];
    dreamDateLabel.font = setFont(11);
    dreamDateLabel.textColor = APPColorFromRGBA_0x(0xa5a5a5, 1);
    dreamDateLabel.textAlignment = NSTextAlignmentRight;
    self.dreamDateLabel = dreamDateLabel;
    [self.contentView addSubview:dreamDateLabel];
    
    NSMutableArray *dreamPicImageViewArray = [NSMutableArray array];
    for (int a = 0; a < 9; a ++) {
        APPImageView *imageView = [[APPImageView alloc]init];
        imageView.imageViewStyle = APPImageViewPicture;
        [self.contentView addSubview:imageView];
        [dreamPicImageViewArray addObject:imageView];
    }
    self.dreamPicImageViewArray = dreamPicImageViewArray;
    
    UILabel *dreamContentLabel = [[UILabel alloc]init];
    dreamContentLabel.font = setFont(15);
    dreamContentLabel.textColor = APPColorFromRGBA_0x(0x333333, 1);
    dreamContentLabel.textAlignment = NSTextAlignmentLeft;
    dreamContentLabel.numberOfLines = 0;
    self.dreamContentLabel = dreamContentLabel;
    [self.contentView addSubview:dreamContentLabel];
    
    UIView *bottomLineView = [[UIView alloc]init];
    bottomLineView.userInteractionEnabled = NO;
    bottomLineView.backgroundColor = APPColorFromRGBA_0x(0xf0f0f0, 1);
    self.bottomLineView = bottomLineView;
    [self.contentView addSubview:bottomLineView];
}

-(void)setDreamModel:(DreamModel *)dreamModel
{
    _dreamModel = dreamModel;
    DreamFrame *dreamFrame = [[DreamFrame alloc] init];
    dreamFrame.dreamModel = dreamModel;
    
    [self.userHeaderImageView setFrame:dreamFrame.userHeaderImageFrame];
    [self.userHeaderImageView setImage:[UIImage imageNamed:dreamModel.userHeaderImageUrl]];
    
    [self.userNickNameLable setFrame:dreamFrame.userNickNameFrame];
    [self.userNickNameLable setText:dreamModel.userNickName];
    
    [self.userSignatureLabel setFrame:dreamFrame.userSignatureFrame];
    [self.userSignatureLabel setText:dreamModel.userSignature];
    
    [self.dreamDateLabel setFrame:dreamFrame.dreamDateFrame];
    [self.dreamDateLabel setText:dreamModel.dreamDate];
    
    //    if (dreamModel.dreamPicUrlArray.count > 0) {
    for (int a = 0; a < 9; a++) {
        APPImageView *imageView = [self.dreamPicImageViewArray objectAtIndex:a];
        if (a < dreamModel.dreamPicUrlArray.count) {
            imageView.hidden = NO;
            CGRect frame = [[dreamFrame.dreamPicFrameArray objectAtIndex:a] CGRectValue];
            [imageView setFrame:frame];
            
            [imageView setImage: [UIImage imageNamed:[dreamModel.dreamPicUrlArray objectAtIndex:a]]];
        }
        else
            imageView.hidden = YES;
    }
    //    }
    
    [self.dreamContentLabel setFrame:dreamFrame.dreamContentFrame];
    [self.dreamContentLabel setText:dreamModel.dreamContent];
    
    [self.bottomLineView setFrame:dreamFrame.dreamBottomLineViewFrame];
}


@end
