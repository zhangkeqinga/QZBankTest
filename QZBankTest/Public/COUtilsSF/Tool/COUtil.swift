//
//  UnitDefine.swift
//  COSFUICatalog
//
//  Created by carlosk on 14/12/28.
//  Copyright (c) 2014年 carlosk. All rights reserved.
//  类方法的使用 结构体的使用

import Foundation
import UIKit

public struct CU {
	
    //获取类名
	public static func getClassName(classType:AnyClass) ->String?{
		var className :String?
		let classNames	= NSStringFromClass(classType).componentsSeparatedByString(".")
		if classNames.count > 1 {
			className = classNames[1] ?? ""
		}
		return className
	}
	 
    //在主线程运行
	public static func runInMain(block:()->Void){
		dispatch_async(dispatch_get_main_queue(), { () -> Void in
			block()
		})
	}
    
	//MARK: 常用方法
	//通知相关
	public static func notifyRemove(o:AnyObject){
		NSNotificationCenter.defaultCenter().removeObserver(o)
	}
    
	public static func notifyAdd(o:AnyObject,nofityName:String,selectorName:String){
		NSNotificationCenter.defaultCenter().addObserver(o, selector: Selector(selectorName), name: nofityName, object: nil)
	}
    
	public static func notifyPost(nofityName:String,o:AnyObject? = nil){
		NSNotificationCenter.defaultCenter().postNotificationName(nofityName, object: o)
	}
    
	//这样弄不好，你和我的时间都耽误了
	//即时调用,这个是用来做代码重构的
	public static func  local(closure: ()->()) {
		closure()
	}
	
	//MARK: 延迟执行
	public typealias CUTask = (cancel : Bool) -> ()
	public static func delay(time:NSTimeInterval, task:()->()) -> CUTask? {
		
        func dispatch_later(block:()->()) {
			dispatch_after(
				dispatch_time(
					DISPATCH_TIME_NOW,
					Int64(time * Double(NSEC_PER_SEC))),
				dispatch_get_main_queue(),
				block)
		}
		
		var closure: dispatch_block_t? = task
		var result: CUTask?
		let delayedClosure: CUTask = { cancel in
			if let internalClosure = closure { if (cancel == false) {
				dispatch_async(dispatch_get_main_queue(), internalClosure);
				}
			}
			closure = nil
			result = nil
		}
		result = delayedClosure
		dispatch_later {
			if let delayedClosure = result {
				delayedClosure(cancel: false)
			}
		}
		return result
	}
    
	public static func cancel(task:CUTask?) {
		task?(cancel: true)
	}
}
