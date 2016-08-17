//
//  BaseCommontVC.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/25.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//  通用的VC

import UIKit

class BaseCommontVC: COBaseVC {
	override func createViews() {
		super.createViews()
	}
	override func createEvets() {
		super.createEvets()
	}
	override func createData() {
		super.createData()
	}
    
    
	//登出
	func logout(){
        
//        UserShareInstance.getSharedInstance().partAlarm = LoginSuccessModel.LoginFaild
//        UserShareInstance.getSharedInstance().partService = LoginSuccessModel.LoginFaild
//        UserShareInstance.getSharedInstance().serviceUserM = nil
//        
////        COFileTool.clearDoctmentFile()
//        
//        //关闭远程通知
//        self.closeNotification()
//        
//        COFileTool.clearDiskImage()
//		LoginVC.gotoLoginVC()
        
	}
    
    func closeNotification(){
        
//        GeTuiSdk.setPushModeForOff(true)
//        if UserShareInstance.getSharedInstance().userInfo != nil {
//            NotifyOperationData.operation(UserShareInstance.getSharedInstance().userInfo as! [String:AnyObject],isInternalReceive:false)
//        }
        
    }
    

    
//    //MARK:是否允许推送
//    func isNotAllowedNotification()->Bool{
//        
//        var isAllowedNoti = false
//        if #available(iOS 8.0, *) {
//            let setting:UIUserNotificationSettings = UIApplication.sharedApplication().currentUserNotificationSettings()!
//            if (UIUserNotificationType.None != setting.types) {
//                isAllowedNoti = true
//                NSLog("开启通知")
//                
//            }
//        }
//        else {
//            let type:UIRemoteNotificationType = UIApplication.sharedApplication().enabledRemoteNotificationTypes()
//            if(UIRemoteNotificationType.None != type){
//                isAllowedNoti = true
//                NSLog("开启通知")
//            }
//            
//        }
//        
//        if isAllowedNoti { //开启
//            GeTuiSdk.setPushModeForOff(false)
//        }else {           //关闭
//            GeTuiSdk.setPushModeForOff(true)
//        }
//        
//        return isAllowedNoti
//    }

    
}
