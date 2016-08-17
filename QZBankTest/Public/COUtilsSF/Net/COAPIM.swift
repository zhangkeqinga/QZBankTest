//
//  COAPIEnum.swift
//  MyFramework_Swift
//
//  Created by carlosk on 15/2/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import Foundation
//定义的接口
public class COAPIM {
	
    //获取完整的url
	public var url :String!
    
	//方法名称,这是用来给COHttpOperation回调的
	public var methodName :String!
	
    //模块名称,这是用来区分模块ip的  九宫格新添加
    public var moduleName :String!
    
    // MARK: 工具函数
//	init(url:String,methodName:String){
//		self.url = url
//		self.methodName = methodName
//	}
    
    //九宫格 模块化
    init(url:String,methodName:String,moduleName:String){
        self.url = url
        self.methodName = methodName
        self.moduleName = moduleName

    }

}