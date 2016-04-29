//
//  AppDelegate.h
//  LiLiMi
//
//  Created by wangyongbo on 16/3/3.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import <UIKit/UIKit.h>
//根视图控制器
#import "APPNavigationController.h"
#import "APPTabBarController.h"


#import "ApplyViewController.h"
@class APPADViewControl;
@class HomeViewController;
@class CircleOfDreamViewController;
@class ConversationListController;
@class MineViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,EMChatManagerDelegate>
{
    EMConnectionState _connectionState;
    APPADViewControl * adVC;
    HomeViewController *homeVC;
    CircleOfDreamViewController * circleofdreamVC;
    ConversationListController * conversationlistVC;
    MineViewController *mineVC;
}
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) APPTabBarController *tabBarVC;
//点击登陆后的操作
- (void)loginWithUsername:(NSString *)username password:(NSString *)password;
@end
