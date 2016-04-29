//
//  UIImage+Extention.h
//  A01-QQ聊天
//
//  Created by Steve Xiaohu Zhao on 14-11-29.
//  Copyright (c) 2014年 Steve Xiaohu Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extention)
/**
 *  拉伸图片：从中心拉伸
 *
 *
 *  @return 拉伸后的图片
 */
+ (UIImage *)resizeImage:(NSString *)imgName;
/**
 *  保存图片---tmp
 *
 *  @param imageName 名字
 *
 *  @return yes or no
 */
- (BOOL)saveImageLocalDirTmpWithImageName:(NSString *)imageName;
/**
 *  保存到相册
 *
 *  @param image 图片
 */
+ (void)saveImageToPhotoAlbum:(UIImage*)image;
/**
 *  剪切图片
 *
 *  @param view 截取View的显示内容
 *
 */
+ (instancetype)captureWithView:(UIView *)view;
/**
 *  方正方法
 *
 *  @param aImage 调整的图片
 */
+ (UIImage *)fixOrientation:(UIImage *)aImage;
/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;

/**
 *  返回一张指定大小的图片
 */
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;
@end
