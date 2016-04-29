//
//  UIBarButtonItem+Extension.m
//  FiteamSoft
//
//  Created by ChuanRao on 15/5/23.
//  Copyright (c) 2015年 cn.jianshenfan.www. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
/**
 *  设置UIBarButtonItem
 *
 *  @param CurrImage        默认图片
 *  @param highlightedImage 高亮图片
 *  @param target           接收控制器
 *  @param action           方法
 *
 *  @return UIBarButtonItem
 */
 //2015 11 04 高云修改
+ (UIBarButtonItem *)setBarButtonItemImage:(UIImage *)CurrImage  highlightedImage:(UIImage *)highlightedImage title:(NSString*)title titlecolor:(UIColor*)titlecolor target:(id) target action:(SEL)action isleftbtn:(BOOL)isleftbtn down:(BOOL)down showred:(BOOL)showred{
    UIButton* Btn = [[UIButton alloc]init];
    Btn.titleLabel.font=setFont(16);
    if (CurrImage) {
        [Btn setImage:CurrImage forState:UIControlStateNormal];
        Btn.size=CurrImage.size;
//        Btn.size=CGSizeMake(60*ADAPTIVE_PROPORTION, 60*ADAPTIVE_PROPORTION);
        if (down) {
//            Btn.imageEdgeInsets = isleftbtn?UIEdgeInsetsMake(10*ADAPTIVE_PROPORTION,-(10*ADAPTIVE_PROPORTION),-(10*ADAPTIVE_PROPORTION),-10*ADAPTIVE_PROPORTION):UIEdgeInsetsMake(10*ADAPTIVE_PROPORTION,10*ADAPTIVE_PROPORTION,-(10*ADAPTIVE_PROPORTION),10*ADAPTIVE_PROPORTION);
             //设置image在button上的位置（上top，左left，下bottom，右right）这里可以写负值，对上写－5，那么image就象上移动5个像素
        }
    }
    if (title) {
        [Btn setTitle:title forState:UIControlStateNormal];
        
        [Btn sizeToFit];
//        Btn.titleEdgeInsets = down?UIEdgeInsetsMake(8*ADAPTIVE_PROPORTION,0,-(8*ADAPTIVE_PROPORTION),0):UIEdgeInsetsZero;
    }
    if (titlecolor) {
        [Btn setTitleColor:titlecolor forState:UIControlStateNormal];
    }
    if (highlightedImage) {
        [Btn setImage:highlightedImage forState:UIControlStateHighlighted];
    }
    [Btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
//    APPRedBadge *redbtn=[[APPRedBadge alloc]initWithFrame:CGRectMake(0, 0, 8*ADAPTIVE_PROPORTION, 8*ADAPTIVE_PROPORTION)];
//    [Btn addSubview:redbtn];
//    redbtn.tag = 1;
//    redbtn.badgeValue=showred?@"":nil;
//    [redbtn setCenter:CGPointMake(Btn.width-8*ADAPTIVE_PROPORTION, 8*ADAPTIVE_PROPORTION)];

    
//    UIView*view=[[UIView alloc]initWithFrame:Btn.frame];
//    view.backgroundColor=[UIColor redColor];
//    [view addSubview:Btn];
//    Btn.backgroundColor=[UIColor blueColor];
    //内容容器的偏移，让文字向右偏移20像素
//    Btn.imageEdgeInsets = isleftbtn?UIEdgeInsetsMake(10*ADAPTIVE_PROPORTION,-(10*ADAPTIVE_PROPORTION),-(10*ADAPTIVE_PROPORTION),-10*ADAPTIVE_PROPORTION):UIEdgeInsetsMake(10*ADAPTIVE_PROPORTION,10*ADAPTIVE_PROPORTION,-(10*ADAPTIVE_PROPORTION),10*ADAPTIVE_PROPORTION);
    //设置image在button上的位置（上top，左left，下bottom，右right）这里可以写负值，对上写－5，那么image就象上移动5个像素
//    UITapGestureRecognizer *likeNumLabelsingleRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(action)];
//    likeNumLabelsingleRecognizer.numberOfTapsRequired = 1;
//    [view addGestureRecognizer:likeNumLabelsingleRecognizer];
//    view.userInteractionEnabled = YES;
//    Btn.titleEdgeInsets=down?UIEdgeInsetsMake(10*ADAPTIVE_PROPORTION,-(10*ADAPTIVE_PROPORTION),-(10*ADAPTIVE_PROPORTION),-10*ADAPTIVE_PROPORTION):UIEdgeInsetsZero;
//    down?[Btn topEqualToView:view top:(8*ADAPTIVE_PROPORTION)]:nil;
//    isleftbtn?[Btn leftEqualToView:view left:(-10*ADAPTIVE_PROPORTION)]:[Btn rightEqualToView:view right:(-10*ADAPTIVE_PROPORTION)];
    return [[UIBarButtonItem alloc]initWithCustomView:Btn];
}
@end
