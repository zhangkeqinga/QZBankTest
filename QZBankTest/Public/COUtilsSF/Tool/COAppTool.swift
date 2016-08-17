//
//  COAppTool.swift
//  COXbry
//
//  Created by carlosk on 15/1/19.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

public class COAppTool  {
	
    
    //把字典或数组转换成json字符串
    func dicTurnJsonStrs(obj:AnyObject) ->String?{
        
        if (!NSJSONSerialization.isValidJSONObject(obj)) {  //首先判断能不能转换
            print("is not a valid json object")
            return ""
        }
        let data : NSData! = try? NSJSONSerialization.dataWithJSONObject(obj, options: [])
        //NSData转换成NSString打印输出
        let str = NSString(data:data, encoding: NSUTF8StringEncoding)
        //输出json字符串
        print("Json Str:"); print(str)
        
        //把NSData对象转换回JSON对象
        let json : AnyObject! = try? NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.AllowFragments)
        print("Json Object:"); print(json)

        return str as? String
    }
    
    
    //测试json
    func testJson(obj:AnyObject) {
        let user = ["uname": "张三","tel":["mobile": "138", "home": "010"]]
        
        self.dicTurnJsonStrs(user)
        
    }
    
    
    //根据字符串计算高度
    public class func getRectWithString(string:String,font:UIFont,size:CGSize)-> CGRect?{
        
        let options : NSStringDrawingOptions = NSStringDrawingOptions.UsesLineFragmentOrigin
        let boundingRect = string.boundingRectWithSize(CGSizeMake(size.width, 0), options: options, attributes: [NSFontAttributeName:font], context: nil)

        return boundingRect
        
    }

    
    
	public class func getLauchImage()->UIImage?{

        var suffix = ""
        
			suffix = UIScreen.mainScreen().bounds.size.height >= 568.0 ? "-568h@2x" : "@2x"

		let lauchImageName = "LaunchImage-700\(suffix).png"
        
		return UIImage(named: lauchImageName)
        

	}
	//app的名称
	public class func appName() -> String{
		let info = NSBundle.mainBundle().infoDictionary!
		var value: AnyObject? = info["CFBundleDisplayName"]
		if let value1: AnyObject = value {
			return value1 as! String
		}
		value  = info["CFBundleName"]
        
        if value == nil{
            value = ""
        }
        
		return value as! String
	}
	//获取appicon的名称
	public class func getAppIconName()->String{
		let primaryIconsDictionary = NSBundle.mainBundle().infoDictionary?["CFBundleIcons"]?["CFBundlePrimaryIcon"] as? NSDictionary
		let iconFiles = primaryIconsDictionary!["CFBundleIconFiles"] as! NSArray
		let lastIcon = iconFiles.lastObject as! NSString
		return lastIcon as String
	}
	//版本名称
	public class func appVersionName() -> String{
		let info = NSBundle.mainBundle().infoDictionary!
		let value :AnyObject = info["CFBundleShortVersionString"]!
      
		return value as! String
	}
    
    //版本
    public class func appIdentifier() -> String{
        let info = NSBundle.mainBundle().infoDictionary!
        let value :AnyObject = info["CFBundleIdentifier"]!
        return value as! String
    }

	//版本号
	public class func appVersionCode() -> String{
		let info = NSBundle.mainBundle().infoDictionary!
		let value :AnyObject = info["CFBundleVersion"]!
		return  String(value)
	}
    
    //拨打电话
	public class func callPhone( phoneNames:String){
        
        var phoneName = phoneNames
        
		phoneName = phoneName.stringByReplacingOccurrencesOfString("-", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
		phoneName = phoneName.stringByReplacingOccurrencesOfString(" ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
		let phoneUrl = NSURL(string: "tel://\(phoneName)")
		UIApplication.sharedApplication().openURL(phoneUrl!)
	}
    
    
    
    

}