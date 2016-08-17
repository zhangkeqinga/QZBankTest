//
//  COUIScrollView.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/3/3.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class COUIScrollView: UIScrollView {
	
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		super.touchesBegan(touches, withEvent: event)
		if let block1 = touchesBeganBlock {
			block1()
		}
	}
	var touchesBeganBlock:(()->Void)?
}
