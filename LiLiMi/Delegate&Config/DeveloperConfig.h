//
//  DeveloperConfig.h
//
//  Created by wangyongbo on 15/10/20.
//  Copyright © 2015年 wangyongbo. All rights reserved.
//

#ifndef DeveloperConfig_h
#define DeveloperConfig_h
typedef enum{
    ShareTypeText,
    ShareTypeImage,
    ShareTypeMedia,
    ShareTypeMomey
}ShareType;
//妈的这是什么鬼？？？（ps：高云你出来说说～！这是什么鬼～！）［喷］
//CFAbsoluteTime StartTime;
#endif /* DeveloperConfig_h */

///**
// * 主机服务器地址
// */
//#ifdef DEBUG
//    #define HOST_SERVER @"http://m.jianshenfan.cn/"
//#else
//    #define HOST_SERVER @"http://m.jianshenfan.cn/"
//#endif


/**
 * 主机服务器地址
 */
#ifdef DEBUG
//    #define HOST_SERVER @"http://dev.jianshenfan.cn/"
    #define HOST_SERVER @"http://m.jianshenfan.cn/"
#else
    #define HOST_SERVER @"http://m.jianshenfan.cn/"
#endif

#define codeBaseURL @"http://api.wwei.cn/wwei.html?"
#define codeAppID @"20151211153642"

/**
 *
 *健身范logo
 */

#define APPLogo @"http://7xp2er.com2.z0.glb.qiniucdn.com/logo80px.png"

#define codeUrl @"http://qr.topscan.com/api.php?&logo=http://7xp2er.com2.z0.glb.qiniucdn.com/logo80px.png&bg=ffffff&fg=000000&text="

#define shareUrl @"http://www.jianshenfan.cn/App/index.html"
/**
 * 企业ACCCODE
 */
#define ACCCODE @""

 /**
  * 苹果iTunes Connect App ID
  */
#define APPID @""

 /**
  * 微信key
  */
#define Weixin_AppID @""
#define Weixin_AppSecret @""

 /**
  * 掌淘科技（短信）
  */
#define SMS_SDK_AppKey @""
#define SMS_SDK_AppSecret @""
//++++++++++++++++++++++++支付宝+++++++++++++++++++++++++++++

/*============================================================================*/
/*=======================需要填写商户app申请的===================================*/
/*============================================================================*/
#define APPPartner @"2088511284144833"
#define APPSeller @"postmaster@52jsf.com"
#define APPPrivateKey @"MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAK5q7fn16weAe7Y1hMJi68Ej+BbI22g7WgVUX1+21eAmeOV7VxtAGO0yqzKiZIppVC8HiGYB2DzYSUHRPajT5ALn6yTw6imCeLHUL8JdUQxE3E0ZATzfQFEVRl6tJEt7o/UZc5CGpWC1e1V5mNGhaOfMb94Wz9a9Hlw8/crj9eUFAgMBAAECgYAuZe+soQjG1B0U2aPZeisxE/p5RTFoxvEpncpJUgAPQuzCT09axnBbGTGFpMGOOHrWj/BvAmqdtQO36Iu4j7WFx+hZE7FKjddJ8pZRouVs6UXV6MzaHQnlq5+6sfSu7F4dgotgEEva/J5P4pt6IyDpcsx2S1duoRzkd6eerQEXOQJBANlDoB9OJO976rOEYKvSIhGIy3viX3+H7RaOFqu5apOqE6NgZlppzT5vzIW+qYps2eMp8gor7HvAINRGuSP9/LsCQQDNg7Rz8yYYfwcQODKKPqGfRYoIcvYD4v42f5Ex6bwmx16lm8Z5PI5Ci6jkLdgcsif+geeWnV3PXnGdOUCcpGk/AkEAtIrZuKn7T3ct5dePbbjEzsVaMqw+p3+QqTmR5UnDIsomX5Fv/JoHEGdfEZUK1hj2RytIEuPFNGDH5x6OIzagmQJBAKjD8RoOoEgZeHlvTMGN8TdT6ahKj5BdhZjHZTpx0Nqfei/RHklM2x32hjjrFL9r5b/weXeLvw+dZPtRmqeHtA0CQQCrhV1v4XrXEnPhRK8pdF+TU5hDErRr+e2b1/Nx7KcZ21CQivMRl2zmqQ2cWib6mqyAhQkWcs8rJQEoRR+7AHr8"
/*============================================================================*/
/*============================================================================*/
/*============================================================================*/
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>常用颜色>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
/**
 * 黄色：#ffcc00
 * 主色调为 黄色 ，整体配色方案为 黄黑 配色
 */
#define COLOR_MIAN_YELLOW APPColorFromRGBA_0x(0xffcc00,1)
/**
 * 黄色：##fabb00
 * 主色调为 黄色 ，整体配色方案为 黄黑 配色
 */
#define COLOR_MIAN_YELLOW_HIGHTLIGHT APPColorFromRGBA_0x(0xfabb00,1)
/**
 * 黑色：#29282e
 * 适用于标题，提示等优先级最高的地方
 */
#define COLOR_MIAN_BLACK APPColorFromRGBA_0x(0x29282e,1)


/**
 * 黑色：#29282e
 * 适用于标题，提示等优先级最高的地方
 */
#define COLOR_GYM_POP_BG_COLOR APPColorFromRGBA_0x(0x212124,1)


/**
 * 深灰色：#666666
 * 适用于正文，评论内容，等等次重要的地方
 */
#define COLOR_MIMOR_DARKGRAY APPColorFromRGBA_0x(0x666666,1)

/**
 * 浅灰色：#b2b3b4
 * 适用于 补充性，不太重要的场合，起补充作用的文字；各种文本框输入之前的提示文字
 */
#define COLOR_MIMOR_LIGHTGRAY APPColorFromRGBA_0x(0xb2b3b4,1)

/**
 * 橙色：#fd8a01
 * 能够引发其他操作；可以点击的文字
 */
#define COLOR_MIMOR_ORANGE APPColorFromRGBA_0x(0xfd8a01,1)

/**
 * 金色：#fabb00
 * TabbarButton被选中的颜色
 */
#define COLOR_TABBAR_SELECTED APPColorFromRGBA_0x(0xfabb00,1)

/**
 * 分割线颜色：#b9b9b9
 * 分割线颜色
 */
#define COLOR_BOTTOM_LINE APPColorFromRGBA_0x(0xb9b9b9,1)


/**
 *
 *
 */
#define COLOR_BACKGRONG APPColorFromRGBA_0x(0xdbdbe0,1)

/**
 *扫码中间线
 *
 */
#define COLOR_SCANE_LINE APPColorFromRGBA_0x(0x00ff00,1)
/**
 *
 *扫码背景颜色
 */
#define COLOR_SCANE_BG APPColorFromRGBA_0x(0x000000,0.5)

//2015-11-2 高云添加
/**
 * WINDOW 背景颜色：#000000
 * WINDOW 背景颜色
 */
#define COLOR_WINDOW_BG_07 APPColorFromRGBA_0x(0x000000,0.7)

/**
 * WINDOW 背景颜色：#000000
 * WINDOW 背景颜色
 */
#define COLOR_WINDOW_BG_05 APPColorFromRGBA_0x(0x000000,0.5)
//2015-11-4 高云添加
/**
 * SEARCH_BORDER 颜色：#e8e8e8
 * SEARCH_BORDER 颜色
 */
#define COLOR_SEARCH_BORDER APPColorFromRGBA_0x(0xe8e8e8,1)
//2015-11-5 高云添加
/**
 * DYNAMIC_BG 颜色：#cbcdcc
 * DYNAMIC_BG 颜色
 */
#define COLOR_DYNAMIC_BG APPColorFromRGBA_0x(0xcbcdcc,1)
//2015-12-3 高云添加
/**
 * CHATROOM_BG 颜色：#e8e8ed
 * CHATROOM_BG 颜色
 */
#define COLOR_CHATROOM_BG APPColorFromRGBA_0x(0xe8e8ed,1)
//2015-11-9 高云添加
/**
 * SETTING_DETAIL_GRAY 颜色：#a8a9aa
 * SETTING_DETAIL_GRAY 颜色
 */
#define COLOR_SETTING_DETAIL_GRAY APPColorFromRGBA_0x(0xa8a9aa,1)
/**
 * SETTING_BOTTOM_GRAY 颜色：#dddde2
 * SETTING_BOTTOM_GRAY 颜色
 */
#define COLOR_SETTING_BOTTOM_GRAY APPColorFromRGBA_0x(0xdddde2,1)
/**
 * SETTING_LOGOUT_RED 颜色：#f15064
 * SETTING_LOGOUT_RED 颜色
 */
#define COLOR_SETTING_LOGOUT_RED APPColorFromRGBA_0x(0xf15064,1)
/**
 * SETTING_FEEDBACK_SERVICE_NUM 颜色：#f38001
 * SETTING_FEEDBACK_SERVICE_NUM 颜色
 */
#define COLOR_SETTING_FEEDBACK_SERVICE_NUM APPColorFromRGBA_0x(0xf38001,1)

/**
 * NOTIMESSAGE_CELL_BG 颜色：#f4f4f4
 * NOTIMESSAGE_CELL_BG 颜色
 */
#define COLOR_NOTIMESSAGE_CELL_BG APPColorFromRGBA_0x(0xf4f4f4,1)



/**
 * BTN_BG_UNENABLE 颜色：#d2d2d2
 * BTN_BG_UNENABLE 颜色
 */
#define COLOR_BTN_BG_UNENABLE APPColorFromRGBA_0x(0xd2d2d2,1)
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>常用字号>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
/**
 * 40PX：适用于标题，重要的提示性文字
 */
#define TEXT_SIZE_MAIN_TITLE 40

/**
 * 36PX：Btn 文字
 */
#define TEXT_SIZE_BTN_TITLE 36

/**
 * 32PX：适用于名称（人名，健身馆名，List文字）
 */
#define TEXT_SIZE_NAME_TITLE 32

/**
 * 24PX：适用于正文 补充性文字，或者小按钮中的文字
 */
#define TEXT_SIZE_TEXT_TITLE 24

/**
 * 20PX：适用范围极少（比如cell中的时间「3天前」）
 */
#define TEXT_SIZE_TIME_TITLE 20

/**
 * 16PX：Tabbar下面的文字
 */
#define TEXT_SIZE_TABBAR_TITLE 16



#define NAVIGATION_BARTINT_COlOR APPColorFromRGBA_0x(0x3194d3,1);
/*********************local.data****************************/
#define MeHomeData @"MeHome.data"
#define AuthorData @"Author.data"
#define AdposData @"Adpos.data"

#define DynamicData @"DynamicData"
#define ReferenceData @"ReferenceData"
/*********************Umeng SDK****************************/
//#define UmengAppID @"55d2ac00e0f55a43b40025cc"
#define UmengAppID @"566f850e67e58e1042006ad1"
/*********************微信  API****************************/
#define WeiXinAppID @"wxddd94faf7dd1fc18"
#define WeiXinAppSecret @"b8cf78972078f39d8527458363a0be53"
#define WeiXinToken @"WeiXinToken.data"
#define LocalLoginToken @"LocalLogin.data"

#define CheckModel @"CheckModel.data"

#define APPAuthScope @"snsapi_message,snsapi_userinfo,snsapi_friend,snsapi_contact";
#define APPAuthOpenID @"0c806938e2413ce73eef92cc3";
#define APPAuthState @"cn.jianshenfan.www";

/*********************微博  API****************************/
#define WeiBoAppID         @"2975832483"
#define WeiBoRedirectURI    @"http://www.jianshenfan.cn"
#define WeiBoAppSecret @"d8aeb0ae4747aa7ac3a83fdbc3e11304"
#define WeiBoToken @"WeiBoToken.data"

/*********************QQ  API****************************/
#define QQAppID        @"1104470697"
#define QQAppKEY @"v8Ry7AW6hWuux5VR"

#define QQToken  @"QQToken.data"

/*********************appStore ID****************************/
#define AppStoreID @"1031156637"

/*********************APPWeChatNum****************************/
#define APPWeChatNum @"APP-er"

/*********************高德 API****************************/
#define LBSApiKey @"ed4ae4bc657d033f576f6c80f45f67ab"

/*********************环信 API****************************/
/**
 * 环信key
 */
#ifdef DEBUG
//#define EMApiKey @"fiteamsoft#test"
#define EMApiKey @"fiteamsoft#fiteamsoft"
#else
#define EMApiKey @"fiteamsoft#fiteamsoft"
#endif
/**
 * 环信EMPuchDevKey
 */
#ifdef DEBUG
//#define EMPuchDevKey @"APP_DEV"
#define EMPuchDevKey @"jianshenfan"
#else
#define EMPuchDevKey @"jianshenfan"
#endif
/**
 * 环信EMPuchProKey
 */
#ifdef DEBUG
#define EMPuchProKey @"jianshenfan_pro"
#else
#define EMPuchProKey @"jianshenfan_pro"
#endif


/*********************POPsharepage****************************/
#define popoverSharePageIamge [UIImage imageNamed:@"popover_tuiguang"]
/*********************POP****************************/
#define navBtnMoreIamge [UIImage imageNamed:@"navifation_btn_more"]

/*********************POP****************************/
#define popSuccessIamge [UIImage imageNamed:@"popover_ico_success"]
#define popErrorIamge [UIImage imageNamed:@"popover_ico_error"]
#define popNetErrorIamge [UIImage imageNamed:@"popover_ico_net"]
#define popCloseBtnIamge [UIImage imageNamed:@"popover_btn_close"]
#define popRefreshBtnIamge [UIImage imageNamed:@"popover_btn_refresh"]
#define popOverIcoUserImage [UIImage imageNamed:@"popover_ico_user"] 


#define popNoMessageImage [UIImage imageNamed:@"popover_opps02"]
/*********************SCANE****************************/
#define scanCodeBgImage [UIImage imageNamed:@"code_bg"]
#define scanListBtnImage [UIImage imageNamed:@"list_btn_scan"]
#define scanNavBtnImage [UIImage imageNamed:@"navigation_btn_code"]
/*********************TheFirstVC****************************/
#define signBgImage [UIImage imageNamed:@"signin_bg_02@2x.jpg"]
#define signWeixinImage [UIImage imageNamed:@"signin_wechat"]
#define signWeiboImage [UIImage imageNamed:@"signin_weibo"]
#define signQqImage [UIImage imageNamed:@"signin_qq"]
#define signLogoImage [UIImage imageNamed:@"signin_logo"]

/*********************Login_Regist**************************/
#define navBtnClose [UIImage imageNamed:@"navifation_btn_close_01"]
#define phoneImage [UIImage imageNamed:@"sign_ico_phone"]
#define pwdImage [UIImage imageNamed:@"sign_ico_password"]
#define messageImage [UIImage imageNamed:@"sign_identifyingcode"]

/*********************完善资料**************************/
#define cameraBtnCameraImage [UIImage imageNamed:@"camera_btn_camera"]
#define girlNormalImage [UIImage imageNamed:@"ico_girl_normal"]
#define girlSelectedImage [UIImage imageNamed:@"ico_girl_selected"]
#define manNormalImage [UIImage imageNamed:@"ico_man_normal"]
#define manSelectedImage [UIImage imageNamed:@"ico_man_selected"]
#define popLeftImage [UIImage imageNamed:@"popover_ico_left"]
#define popRightImage [UIImage imageNamed:@"popover_ico_right"]
/*********************地图资源**************************/
#define mapLocationImage [UIImage imageNamed:@"map_ico_location"]
#define mapSearchImage [UIImage imageNamed:@"map_ico_search"]
#define mapRelocationImage [UIImage imageNamed:@"map_ico_relocation"]
#define mapListLocationImage [UIImage imageNamed:@"map_list_ico_location"]
#define mapGymRelocationImage [UIImage imageNamed:@"map_ico02_relocation"]


#define mapGymImage [UIImage imageNamed:@"map_ico_gym"]
#define mapArrowImage [UIImage imageNamed:@"map_fuckyou"]
/*********************默认头像底图**************************/
#define defaultHeadImage [UIImage imageNamed:@"default_head"]
//#define mapLocationImage [UIImage imageNamed:@"map_ico_location"]
/*********************默认头像底图**************************/
#define defaultGymImage [UIImage imageNamed:@"popover_ico_gym"]

/*********************推荐用户**************************/
#define refreshImage [UIImage imageNamed:@"ico_refresh"]
#define addFriendPhoneImage [UIImage imageNamed:@"trends_addfriend_phone"]
#define addFriendQQImage [UIImage imageNamed:@"trends_addfriend_qq"]
#define addFriendWeChatImage [UIImage imageNamed:@"trends_addfriend_wechat"]
#define addFriendWeiBoImage [UIImage imageNamed:@"trends_addfriend_weibo"]

/*********************通知提醒的view图片资源**************************/
#define notRemindImage [UIImage imageNamed:@"popover_remind"]
/*********************聊天资源**************************/
#define chatEmojiBtnImage [UIImage imageNamed:@"chat_btn_01"]
#define chatPhotoBtnImage [UIImage imageNamed:@"chat_btn_02"]
/*********************nav图片资源**************************/
#define navBackImage [UIImage imageNamed:@"navifation_btn_back"]
#define imageurl @"url"
#define imagekey @"key"
/*********************我的和设置页面图片资源**************************/
#define ListMoreImage [UIImage imageNamed:@"list_more"]
#define settingPunchCardImage [UIImage imageNamed:@"punchcard"]
#define settingActivityImage [UIImage imageNamed:@"setting_ico_activity"]
#define settingCheckImage [UIImage imageNamed:@"setting_ico_check"]
#define settingFeedbackImage [UIImage imageNamed:@"setting_ico_feedback"]
#define settingGymImage [UIImage imageNamed:@"setting_ico_gym"]
#define settingLikeImage [UIImage imageNamed:@"setting_ico_like"]
#define settingImage [UIImage imageNamed:@"setting_ico_setting"]
#define settingLogoImage [UIImage imageNamed:@"setting_logo"]
#define settingAddPhotosImage [UIImage imageNamed:@"setting_addphotos"]

//
#define navBtnYueListImage [UIImage imageNamed:@"navigation_btn_yuelist"]


#define openWifi @"openwifi"
#define openPM @"openPM"
#define localCodeURL @"localCodeURL"
#define localReadMessage @"localReadMessage"
/*********************分享页面图片资源**************************/
#define shareQQdisableImage [UIImage imageNamed:@"share_qq_disable"]
#define shareQQnormlaImage [UIImage imageNamed:@"share_qq_normla"]
#define shareWeChatdisableImage [UIImage imageNamed:@"share_wechat_disable"]
#define shareWeChatnormalImage [UIImage imageNamed:@"share_wechat_normal"]
#define shareWeiBodisableImage [UIImage imageNamed:@"share_weibo_disable"]
#define shareWeiBonormalImage [UIImage imageNamed:@"share_weibo_normal"]
#define signQqdisable [UIImage imageNamed:@"signin_qq_disable"]
#define signWechatdisable [UIImage imageNamed:@"signin_wechat_disable"]
#define popoverBtnCloseRedImage [UIImage imageNamed:@"popover_btn_close_red"]

/*********************支付页面的所有资源**************************/
#define yearCardImage [UIImage imageNamed:@"card_1"]
#define getYearCardImage [UIImage imageNamed:@"card_1"]
#define halfYearCardImage [UIImage imageNamed:@"card_2"]
#define getHalfYearCardImage [UIImage imageNamed:@"card_3"]
#define quarterlyCard [UIImage imageNamed:@"card_4"]
#define getQuarterlyCard [UIImage imageNamed:@"card_5"]
#define monthCardImage [UIImage imageNamed:@"card_6"]
#define getMonthCardImage [UIImage imageNamed:@"card_7"]

//优惠券
#define coupon50Image [UIImage imageNamed:@"card_8"]
#define coupon100Image [UIImage imageNamed:@"card_9"]
#define coupon200Image [UIImage imageNamed:@"card_10"]
#define coupon300Image [UIImage imageNamed:@"card_11"]


//健身馆电话和定位
#define gymBtnMapImage [UIImage imageNamed:@"gym_btn_map"]
#define gymBtnPhoneImage [UIImage imageNamed:@"gym_btn_phone"]

//订单支付页面
#define listIcoSelectedNormalImage [UIImage imageNamed:@"list_ico_selected_normal"]
#define listIcoSelectedImage [UIImage imageNamed:@"list_ico_selected"]
#define listIcoZheImage [UIImage imageNamed:@"list_ico_zhe"]
#define payBtnHireImage [UIImage imageNamed:@"pay_btn_hire"]
#define payBtnHuiImage [UIImage imageNamed:@"pay_btn_hui"]
#define payBtnInstructionsImage [UIImage imageNamed:@"pay_btn_instructions"]
#define payBtnOrderImage [UIImage imageNamed:@"pay_btn_order"]
#define payBtnPhoneImage [UIImage imageNamed:@"pay_btn_phone"]
#define payBtnZhifubaoImage [UIImage imageNamed:@"pay_btn_zhifubao"]
#define settingIcoCarfImage [UIImage imageNamed:@"setting_ico_carf"]


/************************ 用户协议 ********************/
#define XieyiName @"用户协议"
#define XieyiUrl @"http://m.jianshenfan.cn/web/xieyi.html"

/************************ 所有通知的命名 ********************/
#define theFirstBackNoti @"theFirstBack"
#define loginAndRegistBackNoti @"loginAndRegistBack"
#define locateGymBackNoti @"locateGymBackNoti"
#define locateGymDownNoti @"locateGymDownNoti"
#define locateGymBandingNoti @"isbanding"
#define locateGymUnBandingNoti @"unbanding"
#define searchCloseNoti @"searchCloseNoti"
#define beginEditNoti @"beginEditNoti"
#define endEditNoti @"endEditNoti"


//新的通知注册
#define closeRegistNoti @"closeRegistNoti"


/*********************其他****************************/
#define InfoNote @"100字以内(选填)"
#define saveBugImages 8888
#define saveLocalHeaderImageTag 9998
#define saveLocalBgImageTag 9999
#define saveLocalDynamicImageTag 10000
#define saveLocalApplyCerCoach 6666
#define PAGING_Page @"10"
#define ENDEditing [[UIApplication sharedApplication].keyWindow endEditing:YES];
#define XieyiName @"用户协议"
#define XieyiUrl @"http://m.jianshenfan.cn/web/xieyi.html"
#define LOCALLoginModel @"LOCALLoginModel"
#define SAVA_USER_GYMID @"SAVA_USER_GYMID"
#define SAVA_USER_City_name @"City_name"

/************************ 临时 ***************/
#define ADAPTIVE_PROPORTION SCREEN_WIDTH/ IP55S_WIDTH
