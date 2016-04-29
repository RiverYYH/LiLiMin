//
//  APPTabBarController.h
//
//  Created by wangyongbo on 15/10/15.
//  Copyright (c) 2015年 wangyongbo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class APPTabBar;
@interface APPTabBarController : UITabBarController
{
    EMConnectionState _connectionState;
}
@property (nonatomic, weak) APPTabBar *APPtabBar;

/**
 *  创建tabBar对象
 *
 *  @param controllers        子控制器数组
 *  @param titles             子控制器名称数组
 *  @param imageNames         子控制器在tabBar上的图片数组
 *  @param SelectedImageNames 子控制器在tabBar上选中状态图片数组
 *
 */
- (instancetype)initWithViewControllers:(NSArray *)controllers Titles:(NSArray *)titles ImageNames:(NSArray *)imageNames SelectedImageName:(NSArray *)SelectedImageNames;

- (void)jumpToChatList;

- (void)setupUntreatedApplyCount;

- (void)setupUnreadMessageCount;

- (void)networkChanged:(EMConnectionState)connectionState;

- (void)didReceiveLocalNotification:(UILocalNotification *)notification;

- (void)playSoundAndVibration;

- (void)showNotificationWithMessage:(EMMessage *)message;
@end
