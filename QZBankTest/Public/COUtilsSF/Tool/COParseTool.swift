//
//  COParseTool.swift
//  MyFramework_Swift
//
//  Created by carlosk on 15/2/8.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

public class COParseTool: COBaseModel {

	//把字符串转换成字典
	public class func jsonContentParseDict(jsonContent:String?)->[String:AnyObject]?{
		if(jsonContent == nil){
			return nil
		}
				let data = jsonContent!.dataUsingEncoding(NSUTF8StringEncoding)
		var jsonResult : [String:AnyObject]? = nil
		do{
			try jsonResult = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? [String:AnyObject]
		}catch{
			
		}
		return jsonResult
	}
}
