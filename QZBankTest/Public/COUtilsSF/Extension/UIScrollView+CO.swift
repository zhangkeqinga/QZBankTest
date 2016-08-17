//
//  UIScrollView+CO.swift
//  MyFramework_Swift
//
//  Created by carlosk on 15/2/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

public extension UIScrollView {

	//设置scrollview的总高度，根据最后的view的y 和底部的距离
//	bottomH就是距离下面多少距离
	public func setContentWtihLastView(lastView:UIView,bottomH:CGFloat = 0){
		let size = CGSizeMake(width(), lastView.y() + lastView.height() + bottomH)
		contentSize = size
	}
}