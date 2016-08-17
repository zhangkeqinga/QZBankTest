//
//  UITableViewCell+CA.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/28.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

extension BaseCell {
//重置所有的设置
	func resetAllSetting(){
		//: 设置分割线的尺寸
		separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
		if #available(iOS 8.0, *) {
			    layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0)
		} else {
			    // Fallback on earlier versions
		}
	}
}
