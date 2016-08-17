//
//  COBaseView.swift
//  COXbry
//
//  Created by carlosk on 15/1/11.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

enum COTouchType {
	case Began
	case Moved
	case Ended
	case Cancelled
}
public class COBaseV: UIView {
	var touchBlock:((COTouchType,UITouch?)->Void)?//触摸的block
	private var isFrist = true
	//查看是否是第一次
	public func tryFirst(){
		if isFrist {
			isFrist = false
			createViews()
		}
	}
	// MARK: 需要被子类继承的
	func createViews(){
		
	}
	deinit{
		CU.notifyRemove(self)
	}
	
	
	public override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		super.touchesBegan(touches, withEvent: event)
//		log("touchesBegan")
		let touch  = touches.first

		if let touchBlock1 = touchBlock {
			touchBlock1(.Began,touch)
		}
	}
	public override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
		super.touchesCancelled(touches, withEvent: event)
		log("touchesCancelled")
		let touch  = touches?.first
		if let touchBlock1 = touchBlock {
			touchBlock1(.Cancelled,touch)
		}
	}
	public override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
		super.touchesEnded(touches, withEvent: event)
		log("touchesEnded")
		let touch  = touches.first
		if let touchBlock1 = touchBlock {
			touchBlock1(.Ended,touch)
		}
	}
	public override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
		super.touchesMoved(touches, withEvent: event)
		let touch  = touches.first
		if let touchBlock1 = touchBlock {
			touchBlock1(.Moved,touch)
		}
	}

}
