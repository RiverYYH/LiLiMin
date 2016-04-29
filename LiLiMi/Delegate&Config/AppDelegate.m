//
//  AppDelegate.m
//  LiLiMi
//
//  Created by wangyongbo on 16/3/3.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "AppDelegate.h"
//主视图
#import "HomeViewController.h"
#import "CircleOfDreamViewController.h"
#import "FriendsViewController.h"
#import "MineViewController.h"
//环信聊天页面
#import "ConversationListController.h"


#import "AppDelegate+EaseMob.h"

//启动页广告
#import "APPADViewControl.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    
    //初始化4个首页
    homeVC=[[HomeViewController alloc]init];
    circleofdreamVC=[[CircleOfDreamViewController alloc]init];
    conversationlistVC=[[ConversationListController alloc]init];
    mineVC=[[MineViewController alloc]init];

    
    NSArray *titles = @[@"粒粒米",@"愿望圈",@"好友",@"个人"];
    NSArray *controllers = @[homeVC,
                             circleofdreamVC,
                             conversationlistVC,
                             mineVC];
    
    NSArray *imageNames = @[@"homepagebutton",
                            @"wishbutton",
                            @"friendbutton",
                            @"mebutton"];
    NSArray *selectedImageNames = @[@"homepagebutton_selected",
                                    @"wishbutton_selected",
                                    @"friendbutton_selected",
                                    @"mebutton_selected"];
    
    if (!self.tabBarVC) {
        self.tabBarVC = [[APPTabBarController alloc]initWithViewControllers:controllers Titles:titles ImageNames:imageNames SelectedImageName:selectedImageNames];
        //        _tabBarVC.childViewControllers[0].tabBarItem.badgeValue = @"";
        //        _tabBarVC.childViewControllers[1].tabBarItem.badgeValue = @"";
        //        _tabBarVC.childViewControllers[2].tabBarItem.badgeValue = @"";
        //        _tabBarVC.childViewControllers[3].tabBarItem.badgeValue = @"";
    }
    
    if(self.tabBarVC.selectedIndex != 1)
    {
        [self.tabBarVC setSelectedIndex:0];
    }
    
    UINavigationBar *bar = [UINavigationBar appearance];
    //设置显示的颜色
    bar.barTintColor = [UIColor whiteColor];
    //设置字体颜色
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
    
    
    self.window.rootViewController = self.tabBarVC;
    
    
    _connectionState = EMConnectionConnected;
    
#warning 初始化环信SDK，详细内容在AppDelegate+EaseMob.m 文件中
#warning SDK注册 APNS文件的名字, 需要与后台上传证书时的名字一一对应
    NSString *apnsCertName = nil;
#if DEBUG
    apnsCertName = @"chatdemoui_dev";
#else
    apnsCertName = @"chatdemoui";
#endif
    [self easemobApplication:application
didFinishLaunchingWithOptions:launchOptions
                      appkey:@"nxasm#llm"
                apnsCertName:apnsCertName
                 otherConfig:nil];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
