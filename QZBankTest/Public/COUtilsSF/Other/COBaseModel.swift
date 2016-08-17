//
//  COBaseModel.swift
//  COXbry
//
//  Created by carlosk on 15/1/5.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//  Json与对象的相互转化

import UIKit

public class COBaseModel: NSObject {
	//根据字典解析数据
	init(json:NSDictionary){
		super.init()
		parseWithClass(self.classForCoder, json: json)
	}
    
	override init(){
		super.init()
	}
    
	//把对象转换成json字符串
	func converObjectToJsonString()->[String:AnyObject]{
		//先转换成字典
		//然后转换成json字符串
		var outCount:UInt32 = UInt32()
		let properties = class_copyPropertyList(self.classForCoder, &outCount);
		let count = Int(outCount)
		var dict = [String:AnyObject]()
        
        for i in 0...count-1 {
            
			let property = properties[i];
			var key = String()
			let keyPoint = property_getName(property)
			let key1 = UnsafePointer<CChar>(keyPoint)
			key = String.fromCString(key1)!
			let value: AnyObject? = valueForKey(key)
			if value != nil {
				dict[key] = value!
			}
		}
        
//        //释放对象 内存泄漏bug修改
        free(properties)

		return dict
	}

	
    //json字符串解析
	func parseWithClass(mClass:AnyClass,json:NSDictionary){
		
        var outCount:UInt32 = UInt32()
        
        let properties = class_copyPropertyList(mClass, &outCount);
		let count = Int(outCount)
        
        for i in 0...count-1 {
            
			let property = properties[i];
			var key = String()
			let keyPoint = property_getName(property)
			let key1 = UnsafePointer<CChar>(keyPoint)
			key = String.fromCString(key1)!
			//如果class存在,则说明是自定义的
//			let classsMethodSeleotor = Selector("\(key)Class")
			//如果value不存在,说明key有变化,则根据指定的方法获取value
			let value:AnyObject? = json[key]
            if value == nil {
			}
            
            
			if let value1: AnyObject = value{
				if !(value1 is NSNull){
					setValue(value, forKey: key)
				}
			}
            
		}
        
        //释放对象 内存泄漏bug修改
//        properties = nil
        free(properties)

	}
}
