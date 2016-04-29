//
//  DreamModel.m
//  LiLiMi
//
//  Created by wangyongbo on 16/3/14.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//


#define kContentFont 15
#define kCommentFont 13

#import "DreamModel.h"

//dream模型类
@implementation DreamModel


@end


@implementation DreamCommentModel

-(NSAttributedString *)commentAttributedString
{
    if (_commentAttributedString.length == 0) {
        if (self.toUserNickName.length >=1 ) {
            NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@回复%@:%@",self.userNickName,self.toUserNickName,self.commentStr]];
            //把userNickName的字体颜色变为绿色
            [attriString addAttribute:(NSString *)NSForegroundColorAttributeName
                                value:(id)APPColorFromRGBA_0x(0x46a082, 1).CGColor
                                range:NSMakeRange(0, self.userNickName.length)];

            [attriString addAttribute:(NSString *)NSForegroundColorAttributeName
                                value:(id)APPColorFromRGBA_0x(0x46a082, 1).CGColor
                                range:NSMakeRange(self.userNickName.length + 2, self.toUserNickName.length)];
            
//            //改变字体，value必须是一个CTFontRef
//            [attriString addAttribute:(NSString *)NSFontAttributeName
//                                value:[UIFont systemFontOfSize:25]
//                                range:NSMakeRange(0, 4)];
//            
//            //加上下划线，value可以在指定的枚举中选择
//            [attriString addAttribute:(NSString *)NSUnderlineStyleAttributeName
//                                value:NSUnderlineStyleNone
//                                range:NSMakeRange(0, 4)];
            
            _commentAttributedString = attriString;
        }
        else
        {
            NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@：%@",self.userNickName,self.commentStr]];
            
            //把userNickName的字体颜色变为绿色
            [attriString addAttribute:(NSString *)NSForegroundColorAttributeName
                                value:(id)APPColorFromRGBA_0x(0x46a082, 1).CGColor
                                range:NSMakeRange(0, self.userNickName.length)];
            
            _commentAttributedString = attriString;
        }
    }
    return _commentAttributedString;
}

@end


//dream布局计算类
@interface DreamFrame()
{
    CGFloat pointY;
}

@end

@implementation DreamFrame

-(void)setDreamModel:(DreamModel *)dreamModel
{
    _dreamModel = dreamModel;
    [self computeFrame];
}

-(void)computeFrame
{
    //头像布局
    self.userHeaderImageFrame = CGRectMake(20 * ADAPTIVE_PROPORTION, 23 * ADAPTIVE_PROPORTION, 68 * ADAPTIVE_PROPORTION, 68 * ADAPTIVE_PROPORTION) ;

    //昵称布局
    self.userNickNameFrame = CGRectMake(110 * ADAPTIVE_PROPORTION, 34 * ADAPTIVE_PROPORTION, 380 * ADAPTIVE_PROPORTION, 28 * ADAPTIVE_PROPORTION) ;
    
    //个人签名布局
    self.userSignatureFrame = CGRectMake(110 * ADAPTIVE_PROPORTION, 64 * ADAPTIVE_PROPORTION, 380 * ADAPTIVE_PROPORTION, 28 * ADAPTIVE_PROPORTION);
    
    //时间布局
    self.dreamDateFrame = CGRectMake(460 * ADAPTIVE_PROPORTION, 27 * ADAPTIVE_PROPORTION, 160 * ADAPTIVE_PROPORTION, 28 * ADAPTIVE_PROPORTION);
    
    //发布图片数组布局
    if (self.dreamModel.dreamPicUrlArray.count == 1)
    {
        NSMutableArray *frameArray = [NSMutableArray array];
        NSValue *value = [NSValue valueWithCGRect:CGRectMake(20 * ADAPTIVE_PROPORTION, 120 * ADAPTIVE_PROPORTION, 600 * ADAPTIVE_PROPORTION, 436 * ADAPTIVE_PROPORTION)];
        [frameArray addObject:value];
        self.dreamPicFrameArray = frameArray;
        pointY = 580 * ADAPTIVE_PROPORTION;
    }
    else if (self.dreamModel.dreamPicUrlArray.count >= 1) {
        NSMutableArray *frameArray = [NSMutableArray array];
        for (int a = 0 ; a < self.dreamModel.dreamPicUrlArray.count ; a ++) {
            NSValue *value = [NSValue valueWithCGRect:CGRectMake(20 * ADAPTIVE_PROPORTION + (a % 3) *(6 + 196) * ADAPTIVE_PROPORTION, (a / 3) * 202 * ADAPTIVE_PROPORTION + 120 * ADAPTIVE_PROPORTION, 196 * ADAPTIVE_PROPORTION, 196 * ADAPTIVE_PROPORTION)];
            [frameArray addObject:value];
        }
        self.dreamPicFrameArray = frameArray;
        pointY = (139 + (self.dreamModel.dreamPicUrlArray.count%3 == 0?self.dreamModel.dreamPicUrlArray.count / 3:self.dreamModel.dreamPicUrlArray.count / 3 +1) * 202) * ADAPTIVE_PROPORTION;
    }
    else
        pointY = 120 * ADAPTIVE_PROPORTION;
    
    //发布文字内容布局
    if(self.dreamModel.dreamContent.length >= 1)
    {
        CGFloat frameH = [PublicFun HeightForText:self.dreamModel.dreamContent withFontSize:kContentFont withTextWidth:545 * ADAPTIVE_PROPORTION];
        self.dreamContentFrame = CGRectMake(50 * ADAPTIVE_PROPORTION, pointY, 545 * ADAPTIVE_PROPORTION, frameH);
        
        pointY += frameH + 20 * ADAPTIVE_PROPORTION;
    }
    
    self.dreamBottomLineViewFrame = CGRectMake(0, pointY, SCREEN_WIDTH, 18 * ADAPTIVE_PROPORTION);
    self.dreamFrameHight = pointY + 18 * ADAPTIVE_PROPORTION;
    
    //回复数组布局
    if (self.dreamModel.commentArray.count >= 1) {
        CGFloat frameY = 26 * ADAPTIVE_PROPORTION;
        NSMutableArray *headerFrameArray = [NSMutableArray array];
        NSMutableArray *commentFrameArray = [NSMutableArray array];
        for (int a = 0; a < self.dreamModel.commentArray.count; a++) {
            
            NSValue *headerFrameValue = [NSValue valueWithCGRect:CGRectMake(12 * ADAPTIVE_PROPORTION, frameY, 48 * ADAPTIVE_PROPORTION, 48 * ADAPTIVE_PROPORTION)];
            [headerFrameArray addObject:headerFrameValue];
            
            frameY += 12 * ADAPTIVE_PROPORTION;
            
            DreamCommentModel *commentModel = [self.dreamModel.commentArray objectAtIndex:a];
            CGFloat frameH = [PublicFun HeightForText:commentModel.commentAttributedString.string withFontSize:kCommentFont withTextWidth:445 * ADAPTIVE_PROPORTION];
            
            NSValue *commentFrameValue = [NSValue valueWithCGRect:CGRectMake(80 * ADAPTIVE_PROPORTION, frameY, 445 * ADAPTIVE_PROPORTION, frameH)];
            [commentFrameArray addObject:commentFrameValue];
            
            frameY += frameH > 36 * ADAPTIVE_PROPORTION ? frameH + 10 * ADAPTIVE_PROPORTION : 46 * ADAPTIVE_PROPORTION;
        }
        self.commentHeaderFrameArray = headerFrameArray;
        self.commentStrFrameArray = commentFrameArray;
        
        self.commentViewFrame = CGRectMake(55 * ADAPTIVE_PROPORTION, pointY, 565 * ADAPTIVE_PROPORTION, frameY);
        pointY += frameY + 25 * ADAPTIVE_PROPORTION;
    }
    
    self.bottomToolBarFrame = CGRectMake(0, pointY, SCREEN_WIDTH, 70 * ADAPTIVE_PROPORTION);
    
    pointY += 70 * ADAPTIVE_PROPORTION;
    
    self.bottomLineViewFrame = CGRectMake(0, pointY, SCREEN_WIDTH, 18 * ADAPTIVE_PROPORTION);
    
    self.allFrameHight = pointY + 18 * ADAPTIVE_PROPORTION;
}

@end


//dream请求数据类
@implementation DreamRequestModel

@end