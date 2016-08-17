//
//  Date+CO.swift
//  COUtilsSF
//
//  Created by carlosk on 14/12/26.
//  Copyright (c) 2014年 carlosk. All rights reserved.
//

import Foundation

public extension NSDate{
    //把日期转换成年月日时分秒的字符串
    public func converToStringWithFormat(formatStr:String="yyyy-MM-dd HH:mm:ss")->String{
        let format = NSDateFormatter()
        format.dateFormat = formatStr
        let formdata = format.stringFromDate(self)
        return formdata
    }
	//获取星期几,从星期1到星期天
	public func getWeekNumber()->(Int,String){
		
		let cal = NSCalendar(calendarIdentifier: NSGregorianCalendar)
		
		let comps = cal?.components(NSCalendarUnit.Weekday, fromDate: self)
		var week:Int = comps?.weekday ?? 1
		week -= 1
		if week > 6 || week < 1 {
			week = 1
		}
		let weekStrs = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"]
		
		//		int week = [comps weekday]; //日期转换为一周的第几天，默认第一天周日，
		return (week,weekStrs[week])
	}

    
    //根据一个字符串日期和标准的格式化字符串获取日期对象
    public class func converToDate(dateStr:String?=nil,formatStr:String="yyyy-MM-dd HH:mm:ss")->NSDate?{
        if dateStr == nil {
            return NSDate()
        }
        let format = NSDateFormatter()
        format.dateFormat = formatStr
        let formdata =  format.dateFromString(dateStr!)
        return formdata
    }
    
    
	
	//获取2个日期的差距
	func getDayGap(date:NSDate)->Int{
		
		var chaju = 0
		_ = NSDate()
		let mDate1 = self.timeIntervalSince1970
		let mDate2 = date.timeIntervalSince1970
		chaju = Int(mDate1 - mDate2)
		chaju = chaju / (24 * 60 * 60)
		if chaju > 0 {
			return chaju
		}
		// 如果为0,则查看是否是同一天,如果不是,则增加1天
		let cal = NSCalendar(calendarIdentifier: NSGregorianCalendar)
		
		var comps = cal?.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day], fromDate: self)
		
		let mDate11:Int = comps?.day ?? 0
		
		comps = cal?.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day], fromDate: date)
		
		let mDate12:Int = comps?.day ?? 0
		if mDate11 != mDate12 {
			chaju += 1
		}
		return chaju
	}

}
