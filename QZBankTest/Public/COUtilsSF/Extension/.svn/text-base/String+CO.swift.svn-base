//
//  NSString+CO.swift
//  COXbry
//
//  Created by carlosk on 15/1/7.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import Foundation

public extension String{
	
	subscript (r: Range<Int>) -> String {
		get {
			let startIndex = self.startIndex.advancedBy(r.startIndex)
			let endIndex = startIndex.advancedBy(r.endIndex - r.startIndex)
			return self[Range(start: startIndex, end: endIndex)]
            
		}
	}
    
//    func stringByAppendingPathComponent(path: String) -> String {
//        let nsSt = self as NSString
//        return nsSt.stringByAppendingPathComponent(path)
//    }
    
	//把字符串转换成字典
	public func jsonContentParseDict()->[String:AnyObject]?{

		let data = self.dataUsingEncoding(NSUTF8StringEncoding)
		if data == nil{
			return nil
		}
		var jsonResult : [String:AnyObject]? = nil
		do{
			try jsonResult = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? [String:AnyObject]
		}catch{
			
		}
		
		return jsonResult
	}
    
    
    
	//MARK: 正则校验
	//正则
	public func verifyBase(regexStr:String) -> Bool{
		if String.isEmpty(regexStr){
			return false
		}
		let regex = try? NSRegularExpression(pattern: regexStr, options: NSRegularExpressionOptions.CaseInsensitive)
		
		let matches = regex?.matchesInString(self, options: NSMatchingOptions(), range: NSMakeRange(0,self.characters.count))
		return matches?.count>0
	}
	
	//校验手机号码
	
	public func verifyPhone() -> Bool{
		return verifyBase("^1\\d{10}$")
	}
	
	//校验身份证
	public func verifyIdentityCard() -> Bool{
		return verifyBase("\\d{15}|\\d{18}")
	}
	
	//校验email
	public func verifyEmail() -> Bool{
		return verifyBase("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*")
	}
	
	//为空的判断
	static  public func isEmpty(content:String?) -> Bool{
		if content == nil {
			return true
		}
		var content1 = content! as NSString
		content1 = content1.stringByReplacingOccurrencesOfString(" ", withString: "")
		return "".characters.elementsEqual((content1 as String).characters)
	}
	static public func isNotEmpty(content:String?) ->Bool{
		return !isEmpty(content)
	}
	
	
	//转换成utf8
	public func utf8()->String{
//		return stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) ?? ""
//		URLFragmentAllowedCharacterSet
		assertionFailure("这个还没做")
		return ""
//		stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.controlCharacterSet())
//		return stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.controlCharacterSet()) ?? ""
	}
	//	//转换成UTF8的字符串
	public static func converUTF8String(data:NSData?) -> String?{
		if data == nil{
			return nil
		}
		let content = NSString(data: data!, encoding: NSUTF8StringEncoding)
		return content as String!
	}
	//任何对象转换成字符串
	public static func converAnyObjectToString(o:AnyObject?) ->String{
		if (o == nil || o!.isKindOfClass(NSNull.self)) {
			return ""
		}
		let o1: AnyObject = o!
		return "\(o1)"
	}
    
    
    //////////// ExSwift
    
    /**
     String length
     */
    
    func length(encode:UInt = NSUTF8StringEncoding) -> Int {
        return self.lengthOfBytesUsingEncoding(encode)
    }
    //var length: Int { return self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) }
    
    /**
     self.capitalizedString shorthand
     */
    var capitalized: String { return capitalizedString }
    
    
    /**
     Inserts a substring at the given index in self.
     :param: index Where the new string is inserted
     :param: string String to insert
     :returns: String formed from self inserting string at index
     */
    func insert ( index: Int, _ string: String) -> String {
        //  Edge cases, prepend and append
        if index > length() {
            return self + string
        } else if index < 0 {
            return string + self
        }
        
        return self[0..<index] + string + self[index..<length()]
    }
    
    /**
     Strips the specified characters from the beginning of self.
     :returns: Stripped string
     */
    func trimmedLeft (characterSet set: NSCharacterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()) -> String {
        if let range = rangeOfCharacterFromSet(set.invertedSet) {
            return self[range.startIndex..<endIndex]
        }
        
        return ""
    }
    
    @available(*, unavailable, message="use 'trimmedLeft' instead") func ltrimmed (set: NSCharacterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()) -> String {
        return trimmedLeft(characterSet: set)
    }
    
    /**
     Strips the specified characters from the end of self.
     :returns: Stripped string
     */
    func trimmedRight (characterSet set: NSCharacterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()) -> String {
        if let range = rangeOfCharacterFromSet(set.invertedSet, options: NSStringCompareOptions.BackwardsSearch) {
            return self[startIndex..<range.endIndex]
        }
        
        return ""
    }
    
    @available(*, unavailable, message="use 'trimmedRight' instead") func rtrimmed (set: NSCharacterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()) -> String {
        return trimmedRight(characterSet: set)
    }
    
    /**
     Strips whitespaces from both the beginning and the end of self.
     :returns: Stripped string
     */
    func trimmed () -> String {
        return trimmedLeft().trimmedRight()
    }
    
    
    
    func split(s:String)->[String]{
        if s.isEmpty {
            var spiltedString=[String]()
            for y in self.characters{
                spiltedString.append(String(y))
            }
            return spiltedString
        }
        return self.componentsSeparatedByString(s)
    }
    
    
    /**
     Parses a string containing a double numerical value into an optional double if the string is a well formed number.
     :returns: A double parsed from the string or nil if it cannot be parsed.
     */
    func toDouble() -> Double? {
        
        let scanner = NSScanner(string: self)
        var double: Double = 0
        
        if scanner.scanDouble(&double) {
            return double
        }
        
        return nil
        
    }
    
    /**
     Parses a string containing a float numerical value into an optional float if the string is a well formed number.
     :returns: A float parsed from the string or nil if it cannot be parsed.
     */
    func toFloat() -> Float? {
        
        let scanner = NSScanner(string: self)
        var float: Float = 0
        
        if scanner.scanFloat(&float) {
            return float
        }
        
        return nil
        
    }
    /**
     Parses a string containing a non-negative integer value into an optional UInt if the string is a well formed number.
     :returns: A UInt parsed from the string or nil if it cannot be parsed.
     */
    func toUInt() -> UInt? {
        if let val = UInt(self.trimmed()){
            if val < 0 {
                return nil
            }
            return UInt(val)
        }
        
        return nil
    }
    
    /**
     Parses a string containing a boolean value (true or false) into an optional Bool if the string is a well formed.
     :returns: A Bool parsed from the string or nil if it cannot be parsed as a boolean.
     */
    func toBool() -> Bool? {
        let text = self.trimmed().lowercaseString
        if text == "true" || text == "false" || text == "yes" || text == "no" {
            return (text as NSString).boolValue
        }
        
        return nil
    }
    
    /**
     Parses a string containing a date into an optional NSDate if the string is a well formed.
     The default format is yyyy-MM-dd, but can be overriden.
     :returns: A NSDate parsed from the string or nil if it cannot be parsed as a date.
     */
    func toDate(format : String? = "yyyy-MM-dd") -> NSDate? {
        let text = self.trimmed().lowercaseString
        let dateFmt = NSDateFormatter()
        dateFmt.timeZone = NSTimeZone.defaultTimeZone()
        if let fmt = format {
            dateFmt.dateFormat = fmt
        }
        return dateFmt.dateFromString(text)
    }
    
    /**
     Parses a string containing a date and time into an optional NSDate if the string is a well formed.
     The default format is yyyy-MM-dd hh-mm-ss, but can be overriden.
     :returns: A NSDate parsed from the string or nil if it cannot be parsed as a date.
     */
    func toDateTime(format : String? = "yyyy-MM-dd hh-mm-ss") -> NSDate? {
        return toDate(format)
    }
    
}

