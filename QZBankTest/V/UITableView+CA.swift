//
//  UITableView+CA.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/28.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit


extension UITableView{
    
	//设置背景
//	func setBgImage(){
//		let bgImage = Config.IsAppstore ? "bg_china" : "koala_bg"
//		let imageV = UIImageView(image: UIImage(named:  bgImage))
//		imageV.frame = frame
//		backgroundView = imageV
//	}
    
    func setBgColorImage(){
        let imageV = UIImageView()
        imageV.backgroundColor = UIColor.whiteColor()
        imageV.frame = frame
        backgroundView = imageV
    }

    
    //重置所有的设置
	func resetAllSetting(){
		clearFootV()
		backgroundColor = UIColor.clearColor()
		separatorStyle = .SingleLine
		separatorColor = UIColor.cellDiver()
		separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
		if #available(iOS 8.0, *) {
		 layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0)
		}
	}
    //分割线设置为透明
	func clearSeparator() {
		separatorStyle = .None
		separatorColor = UIColor.clearColor()
		separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
		if #available(iOS 8.0, *) {
		 layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0)
		}
	}
}
