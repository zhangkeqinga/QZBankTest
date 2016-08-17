//
//  HttpOperation.swift
//  COXbry
//
//  Created by carlosk on 15/1/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//这个类是用来处理请求之前和数据返回之后的内容

import UIKit

public class COHttpOperation : COBaseModel{
    
	public class func operation(threadModel:COThreadM) -> Bool{
		
        //查找方法 并在主线程中执行方法
		let methodName = threadModel.apiIF.methodName
		let seletorStr = "operation\(methodName):"
		let seleotor = Selector(seletorStr)
		
        if self.respondsToSelector(seleotor) {
			self.performSelectorOnMainThread(seleotor, withObject: threadModel,waitUntilDone:true)
			return true
		}else{
			return false
		}
        
	}


}
