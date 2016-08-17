//
//  PopPickerV.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/3/1.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//弹出框

import UIKit
class PopDatePickerV: COBaseV {
	private static var mTag = 198444
	private static var mHeight:CGFloat = 212
	
	@IBOutlet weak var datePickerV: UIDatePicker!
	var dateSelectedBlock:((NSDate) ->Void)?//获取到日期的block
	override func createViews() {
		super.createViews()

	}
    
	//是否显示
	func isShow() -> Bool{
		return y() == 0
	}
    
	class func createOrGet(vc:UIViewController)-> PopDatePickerV{
		let mView = vc.view.viewWithTag(mTag)
		var resultV :PopDatePickerV
		if mView != nil && mView!.isKindOfClass(PopDatePickerV.self){
			resultV = mView as! PopDatePickerV
		}else{
			resultV = PopDatePickerV.create() as! PopDatePickerV
			resultV.tag = mTag
			resultV.datePickerV.backgroundColor = UIColor.whiteColor()
            
            
			resultV.frame = vc.view.frame
			resultV.hidden = true
			vc.view.addSubview(resultV)
		}
		resultV.setY(resultV.height())
		return resultV
	}
    
    class func createOrGetWindow(window:UIWindow)-> PopDatePickerV{
        let mView = window.viewWithTag(mTag)
        var resultV :PopDatePickerV
        if mView != nil && mView!.isKindOfClass(PopDatePickerV.self){
            resultV = mView as! PopDatePickerV
        }else{
            resultV = PopDatePickerV.create() as! PopDatePickerV
            resultV.tag = mTag
            resultV.datePickerV.backgroundColor = UIColor.whiteColor()
            
            
            resultV.frame = window.frame
            resultV.hidden = true
            window.addSubview(resultV)
        }
        resultV.setY(resultV.height())
        return resultV
    }

    
    
	//显示自己
	class func show(vc:UIViewController,dateSelectedBlock:((NSDate) ->Void)?) -> PopDatePickerV{
		let resultV = createOrGet(vc)
		resultV.dateSelectedBlock = dateSelectedBlock
		resultV.showMe()
		return resultV
	}
    
	//隐藏自己
	class func hide(vc:UIViewController){
		createOrGet(vc).hideMe()
	}
	
	//显示错误
	func showMe(){
		if !isShow() {
			setY(self.height())
			self.hidden = false
 
            UIView.animateWithDuration(0.3, animations: { () -> Void in
				self.setY(0)
			})
		}
	}
    
	//隐藏我自己
	func hideMe(){
		if isShow() {
			self.hidden = false
			self.setY(0)
			UIView.animateWithDuration(0.3, animations: { () -> Void in
				self.setY(self.height())
				} , completion: { (v) -> Void in
						self.hidden = true
			})

		}
	}
	
    
	//点击确定按钮
	@IBAction func onClickConfrim(sender: UIButton) {
		log("onClickConfrim")
		//获取值
		let date = datePickerV.date
		//是否有block实现
		if let block1 = dateSelectedBlock {
			block1(date)
		}
		//隐藏自己
		hideMe()
	}
	

	@IBAction func onClickBgBtn(sender: AnyObject) {
		self.hideMe()
	}
	
}
