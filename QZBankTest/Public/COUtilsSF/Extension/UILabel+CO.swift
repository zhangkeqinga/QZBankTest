//
//  UILabel+CO.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/23.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

public extension UILabel {
	//根据内容和宽度获取高度
//	+ (float )sizeWithContent:(NSString *)content withFont:(UIFont *)font withWidth:(float )width{
//根据内容获取宽度
	public func getWidthWithContent()->CGFloat{
		if text == nil {
			return 0
		}
		//	if([content respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]){
		//	NSMutableDictionary *atts = [[NSMutableDictionary alloc] init];
		//	[atts setObject:font forKey:NSFontAttributeName];
		//
		let atts = [NSFontAttributeName:font]
		let text1 = text! as NSString
		
		let size = CGSizeMake(1000, height())
		
		let rect = text1.boundingRectWithSize(size, options: .UsesLineFragmentOrigin, attributes: atts, context: NSStringDrawingContext())
		return rect.size.width
	}
		public func getHeightWithContent()->CGFloat{
			if text == nil {
				return 0
			}
			//	if([content respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]){
			//	NSMutableDictionary *atts = [[NSMutableDictionary alloc] init];
			//	[atts setObject:font forKey:NSFontAttributeName];
			//
			let atts = [NSFontAttributeName:font]
			let text1 = text! as NSString
			
			let size = CGSizeMake(width(), 10000)
			
			let rect = text1.boundingRectWithSize(size, options: .UsesLineFragmentOrigin, attributes: atts, context: NSStringDrawingContext())
			return rect.size.height
	}
//	CGRect rect = [content boundingRectWithSize:CGSizeMake(width,100000)
//	options:NSStringDrawingUsesLineFragmentOrigin
//	attributes:atts
//	context:nil];
//	return rect.size.height;
}
