//
//  SSJNotificationConstant.m
//  SSJ_Shoping
//
//  Created by GFeng on 13-4-17.
//  Copyright (c) 2013年 SSJ. All rights reserved.
//

#import "SSJNotificationConstant.h"


NSString *kSSJNotificationCPDeviceShaken = @"CPDeviceShaken";


//模块内部进行模块跳转
NSString *kJFNotificationJumpToStepTag = @"DoJumpToStepTag";


//下拉刷新显示遮罩
NSString *kJFNotificationShowMaskView = @"DoShowMaskView";

//下拉刷新关闭遮罩
NSString *kJFNotificationHideMaskView = @"DoHideMaskView";

//键盘抬起时，通知页面上升
NSString *kJFNotificationViewControllerUp = @"DoViewControllerUp";

//键盘消失时，通知页面恢复正常
NSString *kJFNotificationViewControllerDown = @"DoViewControllerDown";

//通知页面隐藏弹出框leftpopView
NSString *kJFNotificationHideAllLeftPopView = @"DoHideAllLeftPopView";


/**
 *	@brief	取消未完成的http请求
 *	@author	zhgz
 */
NSString *kJFNotificationWantToClearAllHttp = @"WantToClearAllHttp";



/**
 *	@brief	关闭弹出框
 *	@author	zkq
 */
NSString *kGFColseButtonDonePressed = @"ColseButtonDonePressed";


/**
 *	@brief	关闭弹出框Id
 *	@author	zkq
 */
NSString *kGFColseButtonDonePressedAd = @"ColseButtonDonePressedAd";



/**
 *	@brief	mainViewController 的切换
 *	@author	zhgz
 */
NSString *kGFSelectRootViewController = @"SelectRootViewController";

/**
 *	@brief	添加新的View
 *	@author	zhgz
 */
NSString *kGFAddNewViewController = @"AddNewViewController";



/**
 *	@brief	mainViewController  注册
 *	@author	zkq
 */
NSString *kGFlLoginViewController = @"loginViewController";


/**
 *	@brief  返回首页
 *	@author	zkq
 */
NSString *kGFBackFirstViewController = @"backFirstPageViewcontroller";


/**
 *	@brief  返回首页  logout
 *	@author	zkq
 */
NSString *kGFBackFirstViewControllerLogOut = @"backFirstPageViewcontrollerLogOut";



/**
 *	@brief  removeView
 *	@author	zkq
 */
NSString *kGFHMKRemoveViewController = @"MKRemoveViewcontroller";


/**
 *	@brief  从新搜索 
 *	@author	zkq
 */
NSString *kGFSearchResult = @"SearchResult";


/**
 *	@brief  headerView  遮罩的 移动
 *	@author	zkq
 */
NSString *kGFHeaderViewMoveToActionButton=@"HeaderViewMoveToActionButton";

/**
 *	@brief  HMK  首页的 pickout  页面 中 扫瞄的跳转
 *	@author	zkq
 */
NSString *kGFHMKFirstPagePickoutBntAction=@"HMKFirstpagePickOutBtnAction";


/**
 *	@brief  HMK  首页的 checkout  跳出 到首页  
 *	@author	zkq
 */
NSString *kGFHMKFirstPageCickoutBntActionAndBack=@"HMKFirstpageCickOutBtnActionAndBack";

/**
 *	@brief  返回到首页 storeSeleted隐藏
 *	@author	zkq
 */
NSString *kGFHMKFirstPageStoreSeleHidden=@"kGFHMKFirstPageStoreSeleHidden";


/**
 *	@brief 第一家商店的进店欢迎
 *	@author	zkq
 */
NSString *KGFWelcomeFirstStorePressed=@"kGFWelcomeFirstStorePressed";


/**
 *	@brief 从扫瞄界面  返回 后 显示  storeView 底部导航
 *	@author	zkq
 */
NSString *KGFScanBackHyperShowStorebgViewNavigation=@"KGFScanBackHyperShowStorebgViewNavigation";


/**
 *	@brief 第  large beauty家商店的进店欢迎
 *	@author	zkq
 */
NSString *KGFLargeBeautyScan=@"KGFLargeBeautyScan";


/**
 *	@brief 第  hyper进入扫瞄 页面
 *	@author	zkq
 */
NSString *KGFHyperMarketScan=@"KGFHyperMarketScan";



/**
 *	@brief  碰一碰
 *	@author	zkq
 */
NSString *KGFBumpData=@"BumpData";

/**
 *	@brief  中控
 *	@author	zkq
 */
NSString *KGFAdminControlStudentDevice=@"adminControlStudentDevice";

/**
 *	@brief  中控 变化  后 改变 遮罩
 *	@author	zkq
 */
NSString *KGFAdminControlStudentHeaderMoveImage=@"adminControlStudentDeviceHeaderMoveImage";

/**
 *	@brief  语言的选者
 *	@author	zkq
 */
NSString *KGFLangueChooseMian=@"KGFLangueChooseMian";

/**
 *	@brief   导航栏中的数字提醒
 *	@author	zkq
 */
NSString *KGFHeaderNavigationMarkNumber=@"headerNavigationMarkNumber";



/**
 *	@brief  导航栏中的遮罩的移动
 *	@author	zkq
 */
NSString *KGFHeaderNavigationMoveButton=@"headerNavigationMoveButton";

/**
 *	@brief  扫瞄二维码  跳到 对应的商店 并弹出广告
 *	@author	zkq
 */
NSString *KGFScanCodeChangeStoreAndPopAdPage=@"scanCodeChangeStoreAndPopAdPage";
