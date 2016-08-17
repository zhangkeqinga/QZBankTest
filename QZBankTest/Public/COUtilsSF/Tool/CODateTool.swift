//
//  DateClass.swift
//  TYCloudAlarmService
//
//  Created by tyApple2014 on 15/9/11.
//  Copyright (c) 2015年 Kaka. All rights reserved.
//

import UIKit

//时间的转化
class CODateTool: NSObject {
    
    //时间 返回2014-06-19 12:12
    class func dateString(date:NSDate) ->String{
        
        let timeInterval:NSTimeInterval = date.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        
        let interval:NSTimeInterval = NSTimeInterval(timeStamp)
        let date2 = NSDate(timeIntervalSince1970: interval)
        
        let dformatter = NSDateFormatter()
        dformatter.dateFormat = "yyyy-MM-dd HH:MM"
        let  chinaTime = dformatter.stringFromDate(date2)
        
        
        return chinaTime
    }
    
    //时间 返回
    class func nowDateString() ->String{
        let date = NSDate()
        
        let timeInterval:NSTimeInterval = date.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        
        let interval:NSTimeInterval = NSTimeInterval(timeStamp)
        let date2 = NSDate(timeIntervalSince1970: interval)
        
        let dformatter = NSDateFormatter()
        dformatter.dateFormat = "yyyy-MM-dd HH:MM"
        let  chinaTime = dformatter.stringFromDate(date2)
        
        return chinaTime
    }
    
    //返回时间带最后毫秒
    class func nowDateMsString() ->String{
        let date = NSDate()
        let timeInterval:NSTimeInterval = date.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        
        let interval:NSTimeInterval = NSTimeInterval(timeStamp)
        let date2 = NSDate(timeIntervalSince1970: interval)
        
        let dformatter = NSDateFormatter()
        dformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let  chinaTime = dformatter.stringFromDate(date2)
        
        return chinaTime
        
    }
    
    //时间 返回年月日 时分秒 截取功能
    class func changeDateMsString(time:String) ->String{
        var dateStr:String = time
        let length = dateStr.characters.count
        if  length > 19 {
            dateStr = dateStr[0...18]
        }
        return dateStr
    }
    
    //返回时间带最后毫秒
    class func nowDateInt() ->Int{
        let date = NSDate()
        let timeInterval:NSTimeInterval = date.timeIntervalSince1970
        let timeStamp = Int(timeInterval)

        return timeStamp
    }
    
    //时间判断
    class func compareDateBool() ->Bool{
        let date = NSDate()
        let timeInterval:NSTimeInterval = date.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        
        let dateForm = NSDateFormatter()
        dateForm.dateFormat = "yyyy-MM-dd HH:mm"
        
        let time = "2017-09-12 09:30"
        let da = dateForm.dateFromString(time)
        let timeInterval1:NSTimeInterval = da!.timeIntervalSince1970
        let timeStamp1 = Int(timeInterval1)

        let time2 = "2016-08-15 19:30"
        let da2 = dateForm.dateFromString(time2)
        let timeInterval2:NSTimeInterval = da2!.timeIntervalSince1970
        let timeStamp2 = Int(timeInterval2)

        
        if timeStamp1 > timeStamp && timeStamp2 < timeStamp {
            return true
        }else{
            return false
        }
        
    }

    
    
}
