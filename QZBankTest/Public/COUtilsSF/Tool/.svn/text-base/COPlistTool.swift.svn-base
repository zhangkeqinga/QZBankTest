//
//  COPlistTool.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/20.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//用于处理Plist的数据

import UIKit

class COPlistTool: COBaseTool {

	//从某个Plist文件里获取数据
	//如果pListName为nil,则说明是从默认的UserDefaults获取
	class func getValue(key:String,pListName:String? = nil) ->AnyObject?{
		
		if let _ = pListName  {
			let path = NSBundle.mainBundle().pathForResource(pListName, ofType: "plist")
			let data = NSMutableDictionary(contentsOfFile: path!)
			if let data1 = data {
				return data1[key]
			}
			return nil
		}
		return NSUserDefaults.standardUserDefaults().valueForKey(key)
	}
	//存储数据,如果PListName有则存到指定的文件里,不然则是UserDefauitl文件里
	class func setValue(key:String,value:AnyObject,pListName:String? = nil ) {
		if let _ = pListName {
			let path = NSBundle.mainBundle().pathForResource(pListName, ofType: "plist")
			let data = NSMutableDictionary(contentsOfFile: path!)!
			data[key] = value
			return
		}
        
		NSUserDefaults.standardUserDefaults().setValue(value, forKey: key)
		NSUserDefaults.standardUserDefaults().synchronize()
	}
	class func setObject(key:String,value:AnyObject,pListName:String? = nil ) {
		if let _ = pListName {
			let path = NSBundle.mainBundle().pathForResource(pListName, ofType: "plist")
			let data = NSMutableDictionary(contentsOfFile: path!)!
			data[key] = value
			return
		}
        
		NSUserDefaults.standardUserDefaults().setObject(value, forKey: key)
		NSUserDefaults.standardUserDefaults().synchronize()
	}
}
