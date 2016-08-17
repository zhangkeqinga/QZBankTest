//
//  UIView+CO.swift
//  COXbry
//
//  Created by carlosk on 15/1/12.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit


public extension UIView {
	
	public func origin() -> CGPoint {
		return frame.origin
	}
    
	public func setOrigin(origin:CGPoint) {
		frame.origin = origin
	}
    
	public func size() -> CGSize {
		return frame.size
	}
    
	public func setSize(size:CGSize) {
		frame.size = size
	}
    
	public func x() -> CGFloat {
		return frame.origin.x
	}
    
	public func setX(x:CGFloat){
		var frame1 = frame
		frame1.origin.x = x
		frame = frame1;
	}
    
	public func y() -> CGFloat {
		return frame.origin.y
	}
    
	public func setY(y:CGFloat) {
		var frame1 = frame
		frame1.origin.y = y
		frame = frame1;
	}
    
	public func width() -> CGFloat {
		return frame.size.width
	}
    
	public func setWidth(width:CGFloat) {
		var frame1 = frame
		frame1.size.width = width
		frame = frame1;
	}
	
	public func height() -> CGFloat {
		return frame.size.height
	}
    
	public func setHeight(height:CGFloat) {
		var frame1 = frame
		frame1.size.height = height
		frame = frame1;
	}
    
	public func getBottom() -> CGFloat {
		
		return height() + y()
	}
    
	//获取右边
	public func getRight() -> CGFloat {
		return x() + width()
	}
    
	//设置x方向居中
	public func setXMiddle(){
		if superview == nil {
			return
		}
		let x = superview!.width()/2 - width()/2
		setX(x)
	}
    
	//设置Y居中
	public func setYMiddle(){
		if superview == nil {
			return
		}
		let y = superview!.height()/2 - height()/2
		setY(y)
	}
    
	//设置x和y都居中
	public func setMiddle(){
		setXMiddle()
		setYMiddle()
	}
    
	//改成圆形
	public func cycle(){
		layer.cornerRadius = width()/2
		layer.masksToBounds = true
	}
    
    public func cycleNum(num:CGFloat){
        layer.cornerRadius = num
        layer.masksToBounds = true
    }
    
    public func ellipse(){
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGrayColor().CGColor
        
    }

    //改成圆形
    public func cycleNumber(num:CGFloat){
        layer.cornerRadius = num
        layer.masksToBounds = true
    }
    
    
    
    
    
	//迭代查找指定tab的子view
	public func getSubViewWithTag(tag:Int,block:(UIView)->Void){
		for eachV in subviews {
			if eachV.tag == tag {
				block(eachV)
			}
			eachV.getSubViewWithTag(tag, block: block)
		}
		
	}
    
	//根据一定的条件获取某个view
	public func getSubViewWithCondition(conditionBlock:(Int)->Bool,block:(UIView)->Void){
		for eachV in subviews {
			if(conditionBlock(eachV.tag)){
				block(eachV)
			}
			eachV.getSubViewWithCondition(conditionBlock, block: block)
		}
		
	}
	
	// 通过xib的名称创建View
	public class func create(xibName:String? = nil) -> UIView?{
		let xibName1 = xibName ?? CU.getClassName( self)
		let cells = NSBundle.mainBundle().loadNibNamed(xibName1, owner: nil, options: nil)
		if cells.count == 0{
			return nil
		}
		let view = cells[0] as? UIView
		if let view1 = view {
			if view1.isKindOfClass(COBaseV.self){
				(view1 as! COBaseV).tryFirst()
			}
		}
		return view
	}
    
	//移除所有我的子view
	public func removeAllMyChildView(){
		for eachV in subviews {
			eachV.removeFromSuperview()
		}
	}
}