//
//  UserShareInstance.swift
//  TYKoalaServiceNice
//
//  Created by mac on 16/4/28.
//  Copyright © 2016年 com.cn.koalaservice.ty. All rights reserved.
//  单例

import UIKit


enum LoginSuccessModel:Int  {
    
    case LoginFaild = 0      //权限获取失败
    case LoginSuccess = 1    //权限获取成功
}


class UserShareInstance {
    
    private static let _sharedInstance = UserShareInstance()
    
    var platfromLogin = LoginSuccessModel.LoginFaild
    
    var learnMode = false //false 非学习模式   true 学习模式
    
    class func getSharedInstance() -> UserShareInstance {
        return _sharedInstance
    }
    
    private init() {} // 私有化init方法
    
}