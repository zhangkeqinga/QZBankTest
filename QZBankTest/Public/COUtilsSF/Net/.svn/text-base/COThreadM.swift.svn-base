//
//  COThreadM.swift
//  MyFramework_Swift
//
//  Created by carlosk on 15/2/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//  专门用来做前后台交互的数据模型
    
import Foundation

public class COThreadM :COBaseModel{
	var intValue:Int?
	var intValue2:Int?
	var intValue3:Int?
    
    var intValue4:Int?
    var intValue5:Int?
    var intValue6:Int?

//	var floatValue:CGFloat?
//	var floatValue2:CGFloat?
//	var floatValue3:CGFloat?
    
	var stringValue:String?
	var stringValue2:String?
	var stringValue3:String?
	var stringValue4:String?
    var stringValue5:String?
    var stringValue6:String?
    var stringValue7:String?
    var stringValue8:String?
    
    var doubleValue:Double?
    var doubleValue2:Double?
    var doubleValue3:Double?

	var objectValue:AnyObject?
	var objectValue2:AnyObject?
	var arrayValue:[AnyObject]?
	var arrayValue2:[AnyObject]?
	var arrayValue3:[AnyObject]?
    
	var receiveUIBlock:((threadMsg:COThreadM)->Void)? //UI端接收到的返回
	var receiveToBackgourdBlock:((threadMsg:COThreadM)->Void)?//后台端接收到的返回
	var receiveIsSuccess:Bool=false
	var receiveContent:String?
	var receiveErrorMsg:String="未知错误"
	var receiveResultDict:[String:AnyObject]?//返回的结果是字典
	var receiveResultArrayDict:[[String:AnyObject]]?//返回的结果是数组
	var receiveErrorCode:Int = -1//错误码\ d
	let httpEntyModel:COHttpEntyModel!
    
	var autoShowErrorMsg:Bool = true//是否自动显示错误提示,默认为true,当有错误提示的时候,会自动在当前viewcontroller上显示出来,注意,如果显示出了错误,就不会返回到receiveUIBlock里
	var hasOperationReceive:Bool = true//是否要处理返回的结果
	var createDate:NSDate!
	var autoShowProgressV:Bool = true  //当开始请求的时候自动显示进度条
	var autoHideProgressVWithFinishedRequest:Bool = true//当停止请求的时候自动隐藏进度条
	
	let apiIF:COAPIM//接口消息
    
	func setReceiveToBackgourBlock(block:((COThreadM)->Void)){
		receiveToBackgourdBlock = block
	}
    
    //1
	init(apiIF:COAPIM){
		self.httpEntyModel = COHttpEntyModel(url:apiIF.url)
		self.createDate = NSDate()
		self.apiIF = apiIF
		super.init()
	}
    
    //2
	//post 自己,发送到后台的线程去
	public func postMe(receiveUIBlock:((COThreadM)->Void)? = nil){
		COHttpService.post(self, receiveUIBlock:receiveUIBlock)
	}
    
    //3
	//发送一个不需要处理的threadMessage
	public class func postToNet(apiIF:COAPIM,receiveUIBlock:((COThreadM)->Void)? = nil){
		let tm = COThreadM(apiIF: apiIF)
		COHttpService.post(tm, receiveUIBlock:receiveUIBlock)
	}

}
