//
//  COTFTVHandler.swift
//  BDaoyou
//
//  Created by carlosk on 15/3/20.
//  Copyright (c) 2015年 palmyou. All rights reserved.
//输入框view的辅助类

import UIKit

public class COTFTVHandler: COBaseModel,UITextFieldDelegate,UITextViewDelegate {
	private var tfTVs:[AnyObject]?
	//处理返回按钮的次序
	public func operationReturnKeyOrder(tfTVs:[AnyObject]){
		self.tfTVs = tfTVs
		
		for item in tfTVs {
			let (tf,tv) = converObjectToTFTV(item)
			if tf != nil {
				tf!.delegate = self
			}else if tv != nil {
				tv!.delegate = self
			}
		}
	}
	public func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool{
		let isReturn = "\n".characters.elementsEqual(text.characters)
		if isReturn {
			textView.resignFirstResponder()
			return false
		}
		return true
	}
	//把一个对象转换成View
	private func converObjectToTFTV(object:AnyObject)->(UITextField?,UITextView?){
		if object.isKindOfClass(UITextView) {
			return (nil,(object as! UITextView))
			
		}else if object.isKindOfClass(UITextField) {
			return ((object as! UITextField),nil)
		}
		return (nil,nil)
	}
	public func textFieldShouldReturn(textField: UITextField) -> Bool{
		if self.tfTVs == nil {
			return true
		}
		var seletedIndex = -1
		for (index,item) in (self.tfTVs!).enumerate() {
			let (tf,_) = converObjectToTFTV(item)
			if tf == nil {
				continue
			}
			if tf! == textField {
				seletedIndex = index
				break
			}
		}
		if seletedIndex >= 0 && self.tfTVs!.count > seletedIndex + 1 {
			let item_: AnyObject = self.tfTVs![seletedIndex + 1]
			let (tf,tv) = converObjectToTFTV(item_)
			if tf != nil {
				tf!.becomeFirstResponder()
			}else if tv != nil {
				tv!.becomeFirstResponder()
			}
		}else{
			textField.resignFirstResponder()
		}
		return true
	}
}
