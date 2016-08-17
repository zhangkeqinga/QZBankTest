//
//  UIColoer+CO.swift
//  BDaoyou
//
//  Created by carlosk on 15/1/23.
//  Copyright (c) 2015年 palmyou. All rights reserved.
//

import UIKit
import Foundation
public extension UIColor {
	//颜色转换成Image
	public func transformImage()->UIImage {
		let rect = CGRectMake(0, 0, 1, 1)
		UIGraphicsBeginImageContext(rect.size)
		let context = UIGraphicsGetCurrentContext()
		CGContextSetFillColorWithColor(context, CGColor)
		CGContextFillRect(context, rect)
		let theImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext()
		return theImage
	}
//	//16进制转换成UIColor
	public class func colorWithRGBHex(hex:UInt32,alpha:CGFloat = 1) -> UIColor {
		let r = CGFloat((hex >> 16) & 0xFF)
		let g = CGFloat((hex >> 8) & 0xFF)
		let b = CGFloat((hex) & 0xFF)
		return UIColor(red: r/225.0, green:g/225.0, blue: b/225.0, alpha: alpha)
	}
	
//	//根据字符串创建Color,比如d16c11
//	+(UIColor *)createColorWithString:(NSString *)cString{
//	if ([cString length] < 6)
//	return [UIColor whiteColor];//如果非十六进制，返回白色
//	if ([cString hasPrefix:@"#"])
	
	public class func createColorWithString(cStr:String)->UIColor {

        var cString = cStr
        
		if cString.characters.count < 6 {
			return UIColor.whiteColor()
		}
		if cString.hasPrefix("#"){
//			let range = Range(start: 1,end: cString.characters.count)
            
            let range:Range<Int> = 1..<cString.characters.count
            

			cString = cString[range]
		}
//		let range = Range(start: 0,end: 2)
        let range:Range<Int> = 0..<2

		let rStr = cString[range]
//		let gStr = cString[Range(start:2,end: 4)]
//		let bStr = cString[Range(start:4,end: 6)]
        
        let gStrRange:Range<Int> = 2..<4
        let bStrRange:Range<Int> = 4..<6
        let gStr = cString[gStrRange]
        let bStr = cString[bStrRange]

		let r = UnsafeMutablePointer<UInt32>.alloc(0)
		NSScanner(string: rStr).scanHexInt(r)
		let b = UnsafeMutablePointer<UInt32>.alloc(0)
		NSScanner(string: bStr).scanHexInt(b)
		let g = UnsafeMutablePointer<UInt32>.alloc(0)
		NSScanner(string: gStr).scanHexInt(g)
		return UIColor(red: CGFloat(r.memory)/255.0, green:CGFloat(g.memory)/255.0, blue: CGFloat(b.memory)/255.0, alpha: 1)
	}
    
	//创建颜色和透明度
	public class func createColorWithString(cStrings:String,alpha:CGFloat)->UIColor {
		
        var cString = cStrings
        
		if cString.characters.count < 6 {
			return UIColor.whiteColor()
		}
		if cString.hasPrefix("#"){
//			let range = Range(start: 1,end: cString.characters.count)
            let range:Range<Int> = 1..<cString.characters.count

			cString = cString[range]
		}
//		let range = Range(start: 0,end: 2)
        let range:Range<Int> = 0..<2

		let rStr = cString[range]
//		let gStr = cString[Range(start:2,end: 4)]
//		let bStr = cString[Range(start:4,end: 6)]
        
        let gStrRange:Range<Int> = 2..<4
        let bStrRange:Range<Int> = 4..<6
        let gStr = cString[gStrRange]
        let bStr = cString[bStrRange]

		let r = UnsafeMutablePointer<UInt32>.alloc(0)
		NSScanner(string: rStr).scanHexInt(r)
		let b = UnsafeMutablePointer<UInt32>.alloc(0)
		NSScanner(string: bStr).scanHexInt(b)
		let g = UnsafeMutablePointer<UInt32>.alloc(0)
		NSScanner(string: gStr).scanHexInt(g)
		return UIColor(red: CGFloat(r.memory)/255.0, green:CGFloat(g.memory)/255.0, blue: CGFloat(b.memory)/255.0, alpha: alpha)
	}
//	//分别取RGB的值
//	NSRange range;
//	range.location = 0;
//	range.length = 2;
//	NSString *rString = [cString substringWithRange:range];
//	
//	range.location = 2;
//	NSString *gString = [cString substringWithRange:range];
//	
//	range.location = 4;
//	NSString *bString = [cString substringWithRange:range];
//	
//	unsigned int r, g, b;
//	//NSScanner把扫描出的制定的字符串转换成Int类型
//	[[NSScanner scannerWithString:rString] scanHexInt:&r];
//	[[NSScanner scannerWithString:gString] scanHexInt:&g];
//	[[NSScanner scannerWithString:bString] scanHexInt:&b];
//	//转换为UIColor
//	return [UIColor colorWithRed:((float) r / 255.0f)
//	green:((float) g / 255.0f)
//	blue:((float) b / 255.0f)
//	alpha:1.0f];
//	
//	}

}
