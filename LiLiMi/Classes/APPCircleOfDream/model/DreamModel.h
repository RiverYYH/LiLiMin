//
//  DreamModel.h
//  LiLiMi
//
//  Created by wangyongbo on 16/3/14.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import <Foundation/Foundation.h>

//@class  DreamFrame;

@interface DreamModel : NSObject

@property(nonatomic,copy) NSString *userHeaderImageUrl;

@property(nonatomic,copy) NSString *userNickName;

@property(nonatomic,copy) NSString *userSignature;

@property(nonatomic,copy) NSString *dreamDate;

@property(nonatomic,strong) NSArray *dreamPicUrlArray;

@property(nonatomic,strong) NSString *dreamContent;

@property(nonatomic,strong) NSArray *commentArray;

@property(nonatomic,copy) NSString *commentCount;

@property(nonatomic,copy) NSString *payCount;

@property(nonatomic,copy) NSString *likeCount;

@end


@interface DreamCommentModel : NSObject

@property(nonatomic,copy) NSString *userHeaderImageUrl;

@property(nonatomic,copy) NSString *userNickName;

@property(nonatomic,copy) NSString *toUserNickName;

@property(nonatomic,copy) NSString *commentStr;

@property(nonatomic,copy) NSAttributedString *commentAttributedString;



@end


@interface DreamFrame : NSObject

@property (nonatomic,strong) DreamModel *dreamModel;

@property (nonatomic,assign) CGRect userHeaderImageFrame;

@property (nonatomic,assign) CGRect userNickNameFrame;

@property (nonatomic,assign) CGRect userSignatureFrame;

@property (nonatomic,assign) CGRect dreamDateFrame;

@property (nonatomic,strong) NSArray *dreamPicFrameArray;

@property (nonatomic,assign) CGRect dreamContentFrame;

@property (nonatomic,assign) CGRect commentViewFrame;

@property (nonatomic,strong) NSArray *commentHeaderFrameArray;

@property (nonatomic,strong) NSArray *commentStrFrameArray;

@property (nonatomic,assign) CGRect bottomToolBarFrame;

@property (nonatomic,assign) CGRect dreamBottomLineViewFrame;

@property (nonatomic,assign) CGRect bottomLineViewFrame;

@property (nonatomic,assign) CGFloat dreamFrameHight;

@property (nonatomic,assign) CGFloat allFrameHight;

@end

@interface DreamRequestModel : NSObject

@end