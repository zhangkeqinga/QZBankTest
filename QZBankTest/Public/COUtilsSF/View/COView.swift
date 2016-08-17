//
//  COView.swift
//  MyFramework_Swift
//
//  Created by carlosk on 15/2/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

public struct CV {
	// MARK: 一些常量
	
	//导航栏的高度
	public static var BaseNavHeight:CGFloat {
		return 44
	}
	
	public static var BaseNavStatusHeight:CGFloat {
		return 64
	}
	
	//状态栏的高度
	public static var BaseStatusHeight:CGFloat {
		return 20
	}
	
	//tabbar的高度
	public static var TabbarHeight:CGFloat{
		return 49
	}
	
	//界面的宽
	public static var BaseWidth:CGFloat{
		return UIScreen.mainScreen().bounds.size.width
	}
    
	//tableview的基本setion的高度
	public static var BaseTableSetionHeadHight:CGFloat{
		return 22
	}
	
	//界面的高
	public static let BaseHeight = UIScreen.mainScreen().bounds.size.height
	//没有状态条的高度
	public static let BaseHeightNoStatus = (BaseHeight - BaseStatusHeight)
	//没有状态条和导航栏的高度
	public static let BaseHeightNoStatusNoNav = (BaseHeight - BaseStatusHeight - BaseNavHeight)

}
