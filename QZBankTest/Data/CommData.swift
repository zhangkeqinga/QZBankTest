//
//  LessonData.swift
//  COXbry
//
//  Created by carlosk on 15/1/9.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit
class CommData: BaseData {

//	//填充组织机构的拼音属性,返回2个内容,一个是大写字母的数组,第二个是每个大写字母对应的联系人列表
//	class func fillOrganizationsWithPinyin(list:[OrganizationM])->([String],[[OrganizationM]])
//	{
//		var capitals = [String:[OrganizationM]]()
//		var otherOrgs = [OrganizationM]()//其他的数据
//		//把所有的名称获取拼音,并且记录在数组中
//		for itemContactM in list {
//			//获取拼音
//			if String.isEmpty(itemContactM.organizationName){
//				continue
//			}
//			let frishtName = (itemContactM.organizationName as NSString).substringToIndex(1)
//			let pinyin = U.changeChineseToPinyin(frishtName)
//			if pinyin == nil || (pinyin!).characters.count == 0 {
//				otherOrgs.append(itemContactM)
//				continue
//			}
//			itemContactM.pinyin = U.changeChineseToPinyin(itemContactM.organizationName) ?? ""
//			//获取首字母
//			let pinyin_ = pinyin! as NSString
//			let capital = pinyin_.substringToIndex(1)
//			//如果首字母不是字母,则放在其他里面
//			log("pinyin_=\(pinyin_)")
//			if !(String(capital)).verifyBase("^[A-Z]?$") {
//				otherOrgs.append(itemContactM)
//				continue
//			}
//			if var myContacts = capitals[capital] {
//				//如果首字母在capitals列表里,则取出数组,赋值
//				myContacts.append(itemContactM)
//				capitals[capital] = myContacts
//			}else{
//				//否则创建数组,赋值
//				var tempList = [OrganizationM]()
//				tempList.append(itemContactM)
//				capitals[capital] = tempList
//			}
//		}
//		var keys = Array(capitals.keys)
//		keys.sortInPlace { (s1, s2) -> Bool in
//			return s1 < s2
//		}
//		//重新排序结果数组
//		var results = [[OrganizationM]]()
//		for str in keys {
//			let orgs = capitals[str]
//			results.append(orgs!)
//		}
//		if otherOrgs.count > 0 {
//			keys.append("其他")
//			results.append(otherOrgs)
//		}
//		return (keys,results)
//	}
//	
//	
//	//填充通讯录的拼音属性,返回2个内容,一个是大写字母的数组,第二个是每个大写字母对应的联系人列表
//	class func fillPersonsWithPinyin( list:[PersonM])->([String],[[PersonM]])
//	{
//		var capitals = [String:[PersonM]]()
//		var otherOrgs = [PersonM]()//其他的数据
//		//把所有的名称获取拼音,并且记录在数组中
//		for itemContactM in list {
//			//获取拼音
//			if String.isEmpty(itemContactM.name.convertToString()){
//				continue
//			}
//			let frishtName = (itemContactM.name as NSString).substringToIndex(1)
//			let pinyin = U.changeChineseToPinyin(frishtName)
//			if pinyin == nil || (pinyin!).characters.count == 0 {
//				otherOrgs.append(itemContactM)
//				continue
//			}
//            
//            //获取首字母
//			itemContactM.pinyin = U.changeChineseToPinyin(itemContactM.name.convertToString()) ?? ""
//			
//			let pinyin_ = pinyin! as NSString
//			let capital = pinyin_.substringToIndex(1)
//			//如果首字母不是字母,则放在其他里面
//			log("pinyin_=\(pinyin_)")
//			if !(String(capital)).verifyBase("^[A-Z]?$") {
//				otherOrgs.append(itemContactM)
//				continue
//			}
//            
//			if var myContacts = capitals[capital] {
//				//如果首字母在capitals列表里,则取出数组,赋值
//				myContacts.append(itemContactM)
//				capitals[capital] = myContacts
//			}
//            else{
//				//否则创建数组,赋值
//				var tempList = [PersonM]()
//				tempList.append(itemContactM)
//				capitals[capital] = tempList
//			}
//		}
//        
//		var keys = Array(capitals.keys)
//		keys.sortInPlace { (s1, s2) -> Bool in
//			return s1 < s2
//		}
//        
//        
//		//重新排序结果数组
//		var results = [[PersonM]]()
//		for str in keys {
//			let orgs = capitals[str]
//			results.append(orgs!)
//		}
//		if otherOrgs.count > 0 {
//			keys.append("其他")
//			results.append(otherOrgs)
//		}
//		return (keys,results)
//	}


}
