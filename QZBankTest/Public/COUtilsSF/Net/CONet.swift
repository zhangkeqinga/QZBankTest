//
//  CONet.swift
//  MyFramework_Swift
//
//  Created by carlosk on 15/2/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//这是专门对外声明CO框架里的net使用提供支持的类

import UIKit
public class CONet{
    
	private static var coHttpOperationTypes:[COHttpOperation.Type] = [COHttpOperation.self]
	//连接网络的类,需要继承COHttpConnect,并实现connect方法
	private static var coHttpConnectType:COHttpConnect.Type? = nil
	//连接网络的block.跟coHttpConnectType的作用一样,如果实现了上面的类,则下面不需要实现.
	private static var coHttpConnectBlock:((COThreadM) -> (String?,NSError?,Int))? = nil
	//处理请求和返回的类
	
    //根据http返回的内容填充threadM
	private static var coHttpFillThreadMWithReturnContentBlock:((String?,NSError?,COThreadM,Int) -> Bool)? = nil
	
    //处理请求和返回的类 所有的请求接口
	public class func setHttpOperationTypes(types:[COHttpOperation.Type]){
		CONet.coHttpOperationTypes = types
	}
    
    
	//根据http返回的内容填充threadM
	public class func setHttpFillThreadMWithReturnContentBlock(block:((String?,NSError?,COThreadM,Int) -> Bool)?){
		CONet.coHttpFillThreadMWithReturnContentBlock = block
	}
	
    
	//连接网络的block.跟coHttpConnectType的作用一样,如果实现了COHttpConnect的子类,则下面不需要实现coHttpConnectBlock.
	public class func setHttpConnectType(type:COHttpConnect.Type? = nil ,coHttpConnectBlock coHttpConnectBlock_:((COThreadM) -> (String?,NSError?,Int))? = nil){
		
        CONet.coHttpConnectType = type
		CONet.coHttpConnectBlock = coHttpConnectBlock_
        
	}
	
	//获取类型,这是给内部使用的
	class func getCOHttpOperationTypes()->[COHttpOperation.Type]{
		return CONet.coHttpOperationTypes
	}
	
	//获取类型,这是给内部使用的
	class func getCOHttpConnectType()->COHttpConnect.Type?{
		return CONet.coHttpConnectType
	}
	
	//获取类型,这是给内部使用的
	class func getCOHttpConnectBlock()->((COThreadM) -> (String?,NSError?,Int))?{
		return CONet.coHttpConnectBlock
	}
	
	//获取类型,这是给内部使用的
	class func getCOHttpFillThreadMWithReturnContentBlock()->((String?,NSError?,COThreadM,Int) -> Bool)?{
		return CONet.coHttpFillThreadMWithReturnContentBlock
	}
}

