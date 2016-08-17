//
//  COFontAndColorToTagHandle.swift
//  BDaoyou
//
//  Created by carlosk on 15/5/2.
//  Copyright (c) 2015年 palmyou. All rights reserved.
//颜色和字体根据tag的规则绘制

import UIKit
public class COFontAndColorToTagHandle: COBaseHandle {
	private static var allColors:[UIColor]?
	private static var allFonts:[UIFont]?
	//设置所有的资源文件,目前只有颜色和字号,但是
	public class func setAllResource(colors:[UIColor],fonts:[UIFont]){
		COFontAndColorToTagHandle.allColors = colors
		COFontAndColorToTagHandle.allFonts = fonts
	}
    
	//设置所有的颜色,字号等
	public class func setAllFontAndColorWithTag(view:UIView){
		//目前规则是一共9位,第一位暂留,固定值是1,第二三位是字号,第四五位是文字颜色,第六七位是背景色,第八九位是tag
		//比如1AABBCCDD,
		//AA就是字号,从F1,F2,F3,F4,F5..
		//BB是文字颜色,从C1,C2,C3,C4.C5..
		//CC是背景色,从C1,C2,C3,C4.C5..
		//DD是tag,用于自定义的tag
		if view.tag >= 100000000 {
			self.setWithView(view)
		}
        
		view.getSubViewWithCondition({ (tag) -> Bool in
			return tag >= 100000000
			}, block: { (v) -> Void in
				//处理颜色
				self.setWithView(v)
		})
	}
	//获取View的特殊tag
	public class func getViewSpecialTag(view:UIView)->Int{
		return view.tag%100
	}
	
	public class func getViewSpecialTagWithTag(tag:Int)->Int{
		return tag%100
	}
	//把自己赋值给这个View
	private class func setWithView(view:UIView){
		//		let mTag = view.tag
		let tag = view.tag
		//aa
		//		第二三位是字号,第四五位是文字颜色,第六七位是背景色
		let aa = tag/1000000%100 - 1
		//这里要做判断,如果是20000以上,则是粗体
		let font = getFontWithIndex(aa,isBold:view.tag > 200000000)
		//bb
		//		123456789
		let bb = (tag % 1000000)/10000 - 1
		//cc
		let fontColor = getColorWithIndex(bb)
		let cc = (tag % 10000)/100 - 1
		let bgColor = getColorWithIndex(cc)
		if view.isKindOfClass(UILabel.self){
			let label = view as! UILabel
			label.font = font ?? label.font
			label.textColor = fontColor ?? label.textColor
			label.backgroundColor = bgColor ?? label.backgroundColor
		}else if view.isKindOfClass(UIButton.self){
			let btn = view as! UIButton
			btn.titleLabel?.font = font ?? btn.titleLabel?.font
//			btn.titleLabel?.textColor = 
			btn.setTitleColor(fontColor ?? btn.titleLabel?.textColor, forState: .Normal)
			btn.setTitleColor(fontColor ?? btn.titleLabel?.textColor, forState: .Highlighted)
			btn.backgroundColor = bgColor ?? btn.backgroundColor
		}else if view.isKindOfClass(UITextField.self){
			let tf = view as! UITextField
			tf.font = font ?? tf.font
			tf.textColor = fontColor ?? tf.textColor
			tf.backgroundColor = bgColor ?? tf.backgroundColor
		}else {
			view.backgroundColor = bgColor ?? view.backgroundColor
		}
	}
    
	
	//根据索引获取颜色
	class func getColorWithIndex(index:Int)->UIColor? {
		if COFontAndColorToTagHandle.allColors == nil {
			return nil
		}
		if index >= (allColors!).count || index < 0{
			return nil
		}
		return COFontAndColorToTagHandle.allColors![index]
	}
	
	//根据索引获取字号
	class func getFontWithIndex(index:Int,isBold:Bool)->UIFont? {
		if COFontAndColorToTagHandle.allFonts == nil {
			return nil
		}
		if index >= (allFonts!).count || index<0{
			return nil
		}
		let font = COFontAndColorToTagHandle.allFonts![index]
		return !isBold ? font : UIFont.boldSystemFontOfSize(font.pointSize)
	}

	
}
