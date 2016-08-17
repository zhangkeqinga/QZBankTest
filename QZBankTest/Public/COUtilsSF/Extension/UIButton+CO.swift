//
//  UIButton+CO.swift
//  MyFramework_Swift
//
//  Created by carlosk on 15/2/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit


public extension UIButton {
	//设置标题
	public func setTitle(title:String){
		setTitle(title, forState: .Normal)
	}
	public func setBgImage(image:UIImage){
		setBackgroundImage(image, forState: .Normal)
	}
	public func setBgImage(image:UIImage,pressImage:UIImage){
		setBackgroundImage(image, forState: .Normal)
		setBackgroundImage(pressImage, forState: .Highlighted)
	}
	
	public func setBgImageName(imageName:String,pressImageName:String){
		setBackgroundImage(UIImage(named: imageName)!, forState: .Normal)
		setBackgroundImage(UIImage(named: pressImageName)!, forState: .Highlighted)
	}
    
    public func setBgImagePress(imageName:UIImage,pressImageName:UIImage){
        setBackgroundImage(imageName, forState: .Normal)
        setBackgroundImage(pressImageName, forState: .Highlighted)
    }

	
    public func setButton(){
        
        
 
     }
    
	
	public func setImage(image:UIImage){
		setImage(image, forState: .Normal)
	}
	
	public func setImageName(imageName:String){
		setImage(UIImage(named: imageName)!, forState: .Normal)
	}
	public func setImage(image:UIImage,pressImage:UIImage){
		setImage(image, forState: .Normal)
		setImage(image, forState: .Highlighted)
	}
	
	public func setImageName(imageName:String,pressImageName:String){
		setImage(UIImage(named: imageName)!, forState: .Normal)
		setImage(UIImage(named: pressImageName)!, forState: .Highlighted)
	}
	//添加点击事件
	public func addOnclickMethod(methodName:String,target:AnyObject){
		addTarget(target, action: Selector(methodName), forControlEvents: UIControlEvents.TouchUpInside)
	}
    
    
	
}
