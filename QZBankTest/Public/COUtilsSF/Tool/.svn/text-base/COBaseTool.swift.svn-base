//
//  COBaseTool.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/20.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class COBaseTool: COBaseModel {
   
    class func getImgeWithPath(mediaString:String)->[UIImage]{
        var imgArray = [UIImage]()
        let imgSArray = COBaseTool.getArrayImageString(mediaString)
        
        for (_,iteam) in imgSArray.enumerate(){
            let img = UIImage(contentsOfFile: iteam as! String)
            if img != nil{
                imgArray.append(img!)
            }
        }
        
        return imgArray
    }
    
    class func getArrayImageString(imgString:String)->NSMutableArray{
        let imageArray = imgString.componentsSeparatedByString(",")
        return NSMutableArray(array: imageArray)
    }
    
    class func removeImgString(index:Int ,imgString:String)->String{
        
        let imageArray:NSMutableArray = self.getArrayImageString(imgString)
        if  imageArray.count > index{
            imageArray .removeObjectAtIndex(index)
        }
        
        var stringImage = String()
        for(num,iteam) in imageArray.enumerate(){
            let mideos = iteam
            
            if imageArray.count <= 1{
                stringImage = mideos as! String
            }else{
                if(num == 0 ) {
                    stringImage = mideos as! String
                }else{
                    stringImage = (stringImage as String) + "," + (mideos as! String)
                    
                }
            }
        }
        
        return String(stringImage)
    }

    
}
