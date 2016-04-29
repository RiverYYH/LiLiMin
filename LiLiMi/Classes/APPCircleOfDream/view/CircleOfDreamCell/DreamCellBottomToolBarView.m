//
//  DreamCellBottomToolBarView.m
//  LiLiMi
//
//  Created by wangyongbo on 16/3/15.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "DreamCellBottomToolBarView.h"

@interface DreamCellBottomToolBarView()

@property (nonatomic,strong) UIView *commentView;

@property (nonatomic,strong) UIImageView *commentImageView;

@property (nonatomic,strong) UILabel *commentLabel;

@property (nonatomic,strong) UIView *payView;

@property (nonatomic,strong) UIImageView *payImageView;

@property (nonatomic,strong) UILabel *payLabel;

@property (nonatomic,strong) UIView *likeView;

@property (nonatomic,strong) UIImageView *likeImageView;

@property (nonatomic,strong) UILabel *likeLabel;

@property (nonatomic,strong) UIView *topLineView;

@property (nonatomic,strong) UIView *middleLine1View;

@property (nonatomic,strong) UIView *middleLine2View;

@property (nonatomic,strong) UIView *bottomLineView;

@end

@implementation DreamCellBottomToolBarView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupControl];
    }
    return self;
}

-(void)setupControl
{
    UIView *commentView = [[UIView alloc]init];
    self.commentView = commentView;
    
    UIImageView *commentImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 34 * ADAPTIVE_PROPORTION, 34 * ADAPTIVE_PROPORTION)];
    commentImageView.image = [UIImage imageNamed:@"Speach_Bubble"];
    self.commentImageView = commentImageView;
    [commentView addSubview:commentImageView];
    
    UILabel *commentLabel = [[UILabel alloc]init];
    commentLabel.font = setFont(12);
    commentLabel.textColor = APPColorFromRGBA_0x(0x9fa3af,1);
    self.commentLabel = commentLabel;
    [commentView addSubview:commentLabel];
    
    UITapGestureRecognizer *commentRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(commentClick)];
    commentRecognizer.numberOfTapsRequired = 1;
    [self.commentView addGestureRecognizer:commentRecognizer];
    [self addSubview:commentView];
    
    UIView *payView = [[UIView alloc]init];
    self.payView = payView;
    
    UIImageView *payImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 34 * ADAPTIVE_PROPORTION, 34 * ADAPTIVE_PROPORTION)];
    payImageView.image = [UIImage imageNamed:@"Dollar-Symbol-On-Circle"];
    self.payImageView = payImageView;
    [payView addSubview:payImageView];
    
    UILabel *payLable = [[UILabel alloc]init];
    payLable.font = setFont(12);
    payLable.textColor = APPColorFromRGBA_0x(0x9fa3af,1);
    self.payLabel = payLable;
    [payView addSubview:payLable];
    
    UITapGestureRecognizer *payRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(payClick)];
    payRecognizer.numberOfTapsRequired = 1;
    [self.payView addGestureRecognizer:payRecognizer];
    [self addSubview:payView];
    
    UIView *likeView = [[UIView alloc]init];
    self.likeView = likeView;
    
    UIImageView *likeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 34 * ADAPTIVE_PROPORTION, 34 * ADAPTIVE_PROPORTION)];
    likeImageView.image = [UIImage imageNamed:@"Loving-Heart-Shape"];
    self.likeImageView = likeImageView;
    [self.likeView addSubview:likeImageView];
    
    UILabel *likeLable = [[UILabel alloc]init];
    likeLable.font = setFont(12);
    likeLable.textColor = APPColorFromRGBA_0x(0x9fa3af,1);
    self.likeLabel = likeLable;
    [self.likeView addSubview:likeLable];
    
    UITapGestureRecognizer *likeRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(likeClick)];
    likeRecognizer.numberOfTapsRequired = 1;
    [self.likeView addGestureRecognizer:likeRecognizer];
    [self addSubview:likeView];

    UIView *topLineView = [[UIView alloc]init];
    topLineView.backgroundColor = APPColorFromRGBA_0x(0xf0f0f0, 1);
    self.topLineView = topLineView;
    [self addSubview:topLineView];
    
    UIView *middleLine1View  = [[UIView alloc]init];
    middleLine1View.backgroundColor = APPColorFromRGBA_0x(0xf0f0f0, 1);
    self.middleLine1View = middleLine1View;
    [self addSubview:middleLine1View];
    
    UIView *middleLine2View  = [[UIView alloc]init];
    middleLine2View.backgroundColor = APPColorFromRGBA_0x(0xf0f0f0, 1);
    self.middleLine2View = middleLine2View;
    [self addSubview:middleLine2View];
    
    UIView *bottomLineView  = [[UIView alloc]init];
    bottomLineView.backgroundColor = APPColorFromRGBA_0x(0xf0f0f0, 1);
    self.bottomLineView = bottomLineView;
    [self addSubview:bottomLineView];
}

-(void)layoutSubviews
{
    [self.commentView setFrame:CGRectMake(0, 0, SCREEN_WIDTH / 3, self.height)];
    [self.commentImageView setCenterY:self.height / 2];
    [self.commentLabel setCenterY:self.height / 2];
    
    [self.payView setFrame:CGRectMake(SCREEN_WIDTH / 3, 0, SCREEN_WIDTH / 3, self.height)];
    [self.payImageView setCenterY:self.height / 2];
    [self.payLabel setCenterY:self.height / 2];
    
    [self.likeView setFrame:CGRectMake(SCREEN_WIDTH / 3 * 2, 0, SCREEN_WIDTH / 3, self.height)];
    [self.likeImageView setCenterY:self.height / 2];
    [self.likeLabel setCenterY:self.height / 2];
    
    [self.topLineView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
    
    [self.middleLine1View setFrame:CGRectMake(SCREEN_WIDTH / 3, self.height / 7 * 2, 1 , self.height / 7 * 3)];
    
    [self.middleLine2View setFrame:CGRectMake(SCREEN_WIDTH / 3 * 2, self.height / 7 * 2, 1, self.height / 7 * 3)];
    
    [self.bottomLineView setFrame:CGRectMake(0, self.height - 1, SCREEN_WIDTH, 1)];
}

-(void)commentClick
{
    self.commentBlock();
}

-(void)payClick
{
    self.payBlock();
}

-(void)likeClick
{
    self.likeBlock();
}

-(void)setDreamModel:(DreamModel *)dreamModel
{
    _dreamModel = dreamModel;
    self.commentLabel.text = dreamModel.commentCount;
    [self.commentLabel sizeToFit];
    [self.commentImageView setCenterX: SCREEN_WIDTH / 6 - (self.commentLabel.width + 6 * ADAPTIVE_PROPORTION) / 2];
    [self.commentLabel setMj_x:CGRectGetMaxX(self.commentImageView.frame) + 6 * ADAPTIVE_PROPORTION ];
    
    self.payLabel.text = dreamModel.payCount;
    [self.payLabel sizeToFit];
    [self.payImageView setCenterX: SCREEN_WIDTH / 6 - (self.payLabel.width + 6 * ADAPTIVE_PROPORTION) / 2];
    [self.payLabel setMj_x:CGRectGetMaxX(self.payImageView.frame) + 6 * ADAPTIVE_PROPORTION ];
    
    self.likeLabel.text = dreamModel.likeCount;
    [self.likeLabel sizeToFit];
    [self.likeImageView setCenterX: SCREEN_WIDTH / 6 - (self.likeLabel.width + 6 * ADAPTIVE_PROPORTION) / 2];
    [self.likeLabel setMj_x:CGRectGetMaxX(self.likeImageView.frame) + 6 * ADAPTIVE_PROPORTION ];
}

@end
