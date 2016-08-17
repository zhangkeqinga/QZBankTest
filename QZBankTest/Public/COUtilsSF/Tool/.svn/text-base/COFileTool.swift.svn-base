//
//  COFileTool.swift
//  iFU_Doctor
//
//  Created by carlosk on 15/7/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class COFileTool: COBaseTool {
    
  
//    + (NSString *)documentFilePathWithFileName:(NSString*)fileName{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
//    return filePath;
//    }

    
    
    class func documentFilePathWithFileName(fileName:String) -> NSString{
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as NSArray
        let documentsDirectory = paths[0] as! NSString
        let filePath = documentsDirectory.stringByAppendingPathComponent(fileName) as NSString
        return filePath

    }

    class func copyDatabaseIfNeededWithFileName(fileName:String ,searchPathDirectory:NSSearchPathDirectory) {
        
        let fileManager = NSFileManager.defaultManager()
        
        let paths = NSSearchPathForDirectoriesInDomains(searchPathDirectory, NSSearchPathDomainMask.UserDomainMask, true) as NSArray
        let documentsDir = paths[0] as! String
        
        let dbPath = (documentsDir as NSString).stringByAppendingPathComponent(fileName)
        print("dbPath=\(dbPath)")
        
        if (!fileManager.fileExistsAtPath(dbPath)) {
            
            let defaultDBPath = (NSBundle.mainBundle().resourcePath! as NSString).stringByAppendingPathComponent(fileName)
            print("defaultDBPath=\(defaultDBPath)")

            try! fileManager.copyItemAtPath(defaultDBPath, toPath: dbPath)

//            do {
//                try fileManager.createDirectoryAtPath(fileName, withIntermediateDirectories: false, attributes: nil) }
//            catch let error as NSError {
//                print(error.localizedDescription);
//            }
        }
        
    }
    

    class func clearCahcheImage() {
        
        //删除缓存中的图片  + "/default"
//        let imgPath = UnitPath.dirLib() + "/Caches" + "/default"
//        do{
//        try NSFileManager.defaultManager().removeItemAtPath(imgPath)
//        }catch{
//        }
    
    }
    
    class func clearDoctmentFile() {
        
        let home = NSHomeDirectory() as NSString;
        let docPath = home.stringByAppendingPathComponent("Documents") as NSString;
        
        do{
            try NSFileManager.defaultManager().removeItemAtPath(docPath as String)
        }catch{
        }
        
     }
    
    class  func clearDiskImage(){
        
        let home = NSHomeDirectory() as NSString;
        var docPath = home.stringByAppendingPathComponent("Documents") as NSString;
        docPath = docPath.stringByAppendingPathComponent("AlarmImage")

        let cacheInQueue = NSOperationQueue()
        cacheInQueue.cancelAllOperations()
        
        
        let fileManager = NSFileManager()
        //创建子目录对应的文件夹
        do {
            try  fileManager.createDirectoryAtPath(docPath as String, withIntermediateDirectories: true, attributes: nil)
        } catch _ {}
        
        do {
            try  fileManager.removeItemAtPath(docPath as String)
        } catch _ {}
        
        
    }
    
    
//    class func getAlarmTypeUrl(alarmCode:String,type:String) -> String{
//        
//        let perons = PersonData.getServicePerson("\(USER_MODULE.m_alarm.rawValue )")! as PersonM
//        let strings = perons.customType
//        let alarmcode = alarmCode
//        
//        let itemBGImageUrl = "/file/" +  strings + "_" + alarmcode + "_"  + "iphone" + "_"  + type
//        
//        return itemBGImageUrl
//    }
    
    //获取报警图片
    class func getAlarmTypeImage(alarmCode:String,type:String)->UIImage?
    {
        
        let filename = self.alarmFileName(alarmCode,type: type)
        let path = self.readpath(filename!)
        
        var image = UIImage(contentsOfFile: path!)
        if image == nil{
            image  = UIImage(named: "line_gray")
        }
        
        return image
        
    }
    
    
    //文件名称  alarmCode type
    class func alarmFileName(alarmCode:String,type:String)->String?{
        
        let fileName = "Alarm_" + alarmCode + type + ".png"
        return fileName
    }
    
    
    //文件路径
    class func readpath(fileName:String)->String?{
        
        // 1、获得沙盒的根路径
        let home = NSHomeDirectory() as NSString;
        // 2、获得Documents路径，使用NSString对象的stringByAppendingPathComponent()方法拼接路径
        let docPath = home.stringByAppendingPathComponent("Documents") as NSString;
        // 3、获取文本文件路径
        var filePath = docPath.stringByAppendingPathComponent("AlarmImage") as NSString;
        
        if (!NSFileManager.defaultManager().fileExistsAtPath(filePath as String)) {
            
            let fileManager = NSFileManager()
            //创建子目录对应的文件夹
            do {
                try  fileManager.createDirectoryAtPath(filePath as String, withIntermediateDirectories: true, attributes: nil)
            } catch _ {}
        }
        
        filePath = filePath.stringByAppendingPathComponent(fileName) as String

        
        return filePath as String

    }
    
    
	//存储图片
    class func saveImage(image:UIImage,fileName:String)->String?{
        
        let filePath = self.readpath(fileName)
        let imageData:NSData = UIImageJPEGRepresentation(image, 1)!;
        // 5、将数据写入文件中
        let results = imageData.writeToFile(filePath!, atomically: true)
        
        if (results) {
            return filePath
        }else{
            return ""
        }
	}
    
    
    class func saveWithFile(dataSource:NSMutableArray) {
        /// 1、获得沙盒的根路径
        let home = NSHomeDirectory() as NSString;
        /// 2、获得Documents路径，使用NSString对象的stringByAppendingPathComponent()方法拼接路径
        let docPath = home.stringByAppendingPathComponent("Documents") as NSString;
        /// 3、获取文本文件路径
        let filePath = docPath.stringByAppendingPathComponent("data.text");
//        let dataSource = NSMutableArray();
//        dataSource.addObject("衣带渐宽终不悔");
//        dataSource.addObject("为伊消得人憔悴");
//        dataSource.addObject("故国不堪回首明月中");
//        dataSource.addObject("人生若只如初见");
//        dataSource.addObject("暮然回首，那人却在灯火阑珊处");
        // 4、将数据写入文件中
        
        dataSource.writeToFile(filePath, atomically: true);
        log("filePath＝\(filePath)");
    }
    
    
    class func readWithFile()->NSMutableArray {
        /// 1、获得沙盒的根路径
        let home = NSHomeDirectory() as NSString;
        /// 2、获得Documents路径，使用NSString对象的stringByAppendingPathComponent()方法拼接路径
        let docPath = home.stringByAppendingPathComponent("Documents") as NSString;
        /// 3、获取文本文件路径
        log("docPath＝\(docPath)");

        let filePath = docPath.stringByAppendingPathComponent("data.text");
        let dataSource = NSMutableArray(contentsOfFile: filePath);
        
        let dataArray = NSMutableArray()
        log("dataArray＝\(dataSource)");
        
        if dataSource != nil{
            return dataSource!
        }else{
            return dataArray
        }
        

    }
    
    
    //读取图片
    class func readImageWithFile(filePath:String) ->UIImage{
        let home = NSHomeDirectory() as NSString
        // 1、获得Documents路径，使用NSString对象的stringByAppendingPathComponent()方法拼接路径
        let docPath = home.stringByAppendingPathComponent("Documents") as NSString;
        // 2、获取文本文件路径
        let filePath = docPath.stringByAppendingPathComponent("filePath")
        // 3、通过路径读取图片
        let savedImage = UIImage(contentsOfFile: filePath)! as UIImage
        
        return savedImage
    }
    

    
    

}
