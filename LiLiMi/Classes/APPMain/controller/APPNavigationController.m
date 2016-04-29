//
//  APPNavigationController.m
//
//  Created by wangyongbo on 15/10/15.
//  Copyright (c) 2015年 wangyongbo. All rights reserved.
//

#import "APPNavigationController.h"

@interface APPNavigationController ()

@end

@implementation APPNavigationController

#pragma mark 第一次使用该类时调用一次
+ (void)initialize
{
    //设置UIBarButtonItem的主题
    [self setupBarButtonItemTheme];
    
    //设置UINavigationBar的主题
    [self setupNavigationBarTheme];
}

#pragma mark 设置navigationBar的主题
+ (void)setupNavigationBarTheme
{
    //通过设置appearance对象，能够修改整个项目中所有UINavigationBar的样式
    UINavigationBar *appearance=[UINavigationBar appearance];
    //设置文字属性
    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
    //设置字体颜色
    textAttrs[NSForegroundColorAttributeName]= [UIColor whiteColor];
    //设置字体
    textAttrs[NSFontAttributeName]=[UIFont systemFontOfSize:16.0];
    //设置字体的偏移量（0）
    //说明：UIOffsetZero是结构体，只有包装成NSValue对象才能放进字典中
    //     textAttrs[NSShadowAttributeName]=[NSValue valueWithUIOffset:UIOffsetZero];
//    [appearance setTitleTextAttributes:textAttrs];
    
    //设置背景颜色
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0) {
        //设置nav的背景颜色
//        [[UINavigationBar appearance] setBarTintColor:RGBACOLOR(114, 214, 174, 1)];
        [appearance setBackgroundImage:[UIImage imageNamed:@"navigation_green"] forBarMetrics:UIBarMetricsDefault];
        [[UINavigationBar appearance] setShadowImage:[UIImage imageNamed:@"navigation_green"]] ;
        //设置nav title字号和颜色字体
        [[UINavigationBar appearance] setTitleTextAttributes:
         [NSDictionary dictionaryWithObjectsAndKeys:RGBACOLOR(0, 0, 0, 1), NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:20.0], NSFontAttributeName, nil]];
    }
    
    //设置7.0以下的导航栏
//    if ([UIDevice currentDevice].systemVersion.floatValue < 7.0){
//        navigationController.navigationBar.barStyle = UIBarStyleDefault;
//        [navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"titleBar"]
//                                                 forBarMetrics:UIBarMetricsDefault];
//        [navigationController.navigationBar.layer setMasksToBounds:YES];
//    }
}

#pragma mark 设置barButtonItem的主题
+ (void)setupBarButtonItemTheme
 {
     //通过设置appearance对象，能够修改整个项目中所有UIBarButtonItem的样式
     UIBarButtonItem *appearance=[UIBarButtonItem appearance];
     //设置文字的属性
     //1.设置普通状态下文字的属性
     NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
     //设置字体
     textAttrs[NSFontAttributeName]=[UIFont systemFontOfSize:15.0];
     //这是偏移量为0
//     textAttrs[NSShadowAttributeName]=[NSValue valueWithUIOffset:UIOffsetMake(5, 0)];
     //设置颜色为白色
     textAttrs[NSForegroundColorAttributeName]=[UIColor blackColor];
     [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];

//     //2.设置高亮状态下文字的属性
//     //使用1中的textAttrs进行通用设置
     NSMutableDictionary *hightextAttrs=[NSMutableDictionary dictionaryWithDictionary:textAttrs];
//     //设置颜色为红色
     [appearance setTitleTextAttributes:hightextAttrs forState:UIControlStateHighlighted];
//
//     //3.设置不可用状态下文字的属性
//     //使用1中的textAttrs进行通用设置
     NSMutableDictionary *disabletextAttrs=[NSMutableDictionary dictionaryWithDictionary:textAttrs];
//    //设置颜色为灰色
     disabletextAttrs[NSForegroundColorAttributeName]=[UIColor lightGrayColor];
     [appearance setTitleTextAttributes:disabletextAttrs forState:UIControlStateDisabled];

     //设置系统默认按钮颜色
     appearance.tintColor=[UIColor blackColor];
     //设置背景
     //技巧提示：为了让某个按钮的背景消失，可以设置一张完全透明的背景图片
//     [appearance setBackButtonBackgroundImage:[UIImage imageNamed:@"navigation_bg_black"]forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

//     [appearance setBackgroundImage:[UIImage imageNamed:@"navigation_bg_black"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//     [appearance setBackgroundImage:[UIImage imageNamed:@"navigation_bg_black"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
}

/**
 *  当导航控制器的view创建完毕就调用
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
}

/**
 *  能够拦截所有push进来的子控制器
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //如果现在push的不是栈顶控制器，那么久隐藏tabbar工具条
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed=YES;
        
//        拦截push操作，设置导航栏的左上角和右上角按钮
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithImage:[navBackImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
     viewController.navigationItem.leftBarButtonItem=leftBarButton;
//             viewController.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithImageName:@"navigationbar_more" highImageName:@"navigationbar_more_highlighted" target:self action:@selector(more)];
    }
    [super pushViewController:viewController animated:YES];
}

-(void)back
{
// #warning 这里用的是self, 因为self就是当前正在使用的导航控制器
     [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
