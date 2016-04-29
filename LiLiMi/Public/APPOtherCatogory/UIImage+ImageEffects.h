//
//  UIImage+ImageEffects.h
//  FiteamSoft_2.0
//
//  Created by 高云 on 15/12/16.
//  Copyright © 2015年 wangyongbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageEffects)
-(UIImage*)applyLightEffect;
-(UIImage*)applyExtraLightEffect;
-(UIImage*)applyDarkEffect;
-(UIImage*)applyTintEffectWithColor:(UIColor*)tintColor;
-(UIImage*)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor*)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage*)maskImage;
-(UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;
@end
