//
//  HttpEntyModel.swift
//  COXbry
//
//  Created by carlosk on 15/1/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class COHttpEntyModel: COBaseModel {
	 
    enum COHttpMethod{
		case Get
		case Post
		case Put
	}
    
	var url:String!
	var method:COHttpMethod
	var uploadPath:String?  //上传文件的路径
	var fileName:String?    //上传文件的名称
	var contentType:String? //上传文件的类型
    
	var param = [String:AnyObject]()
	var headParam = [String:AnyObject]() //头部的
    
	init(url:String,method:COHttpMethod = .Get){
		self.method = method
		self.url = url;
		super.init()
	}
	
}
