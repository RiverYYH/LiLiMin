//
//  APPImageView.h
//  LiLiMi
//
//  Created by wangyongbo on 16/3/16.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

typedef NS_ENUM(NSInteger, APPImageViewStyle) {
    APPImageViewUserHeader = 1,
    APPImageViewPicture
};

#import <UIKit/UIKit.h>

@interface APPImageView : UIImageView

@property (nonatomic,assign) APPImageViewStyle imageViewStyle;

@property (nonatomic,copy) NSString *imageVar;

@end
