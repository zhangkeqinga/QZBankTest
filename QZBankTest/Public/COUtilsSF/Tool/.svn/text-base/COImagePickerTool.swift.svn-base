//
//  COImagePickerTool.swift
//  FixBox
//
//  Created by carlosk on 15/3/31.
//  Copyright (c) 2015年 changyang. All rights reserved.
//

import UIKit
class COImagePickerTool:NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
	private static var pickerTool:COImagePickerTool?
	var getImageBlock:(([NSObject : AnyObject]?)->Void)?
	//单例
	private class func single()->COImagePickerTool{
		if COImagePickerTool.pickerTool != nil {
			return COImagePickerTool.pickerTool!
		}
		COImagePickerTool.pickerTool = COImagePickerTool()
		return COImagePickerTool.pickerTool!
	}
	//显示选择图片的界面
	class func show(vc:UIViewController,type:UIImagePickerControllerSourceType,hasEdit:Bool,getImageBlock:(([NSObject : AnyObject]?)->Void)?){
        
         
		let tool = single()
		tool.getImageBlock = getImageBlock
		let imagePicker = UIImagePickerController()
		imagePicker.sourceType = type
		if type == UIImagePickerControllerSourceType.Camera {
			imagePicker.showsCameraControls = true
		}
		imagePicker.allowsEditing = hasEdit
		imagePicker.delegate = tool
		vc.presentViewController(imagePicker, animated: true, completion: nil)
	}
	
	//MARK: UIImagePickerCOntrollerDelete 
	func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
		log("didFinishPickingMediaWithInfo")
		picker.dismissViewControllerAnimated(true, completion: nil)
		if let block = getImageBlock {
			block(info)
		}
	}
	func imagePickerControllerDidCancel(picker: UIImagePickerController){
		log("imagePickerControllerDidCancel")
		picker.dismissViewControllerAnimated(true, completion: nil)
		if let block = getImageBlock {
			block(nil)
		}
	}
}
