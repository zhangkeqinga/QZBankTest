//
//  QuestionData.swift
//  QZBankTest
//
//  Created by mac on 16/8/5.
//  Copyright © 2016年 com.cn.QZ. All rights reserved.
//

import UIKit

class QuestionData: BaseData {
    
    //获取服务器端端的所有的用户信息
    class func getAllQuestionList()->[QuestionData]{
        return QuestionData.allQuestion
    }
    
    private static var allQuestion:[QuestionData] = []
    
    //获取本地的数据列表
    class func getLoacalPersonList()->[QuestionData]{
        
        let mKey = 1000
        let arr = QuestionData.searchWithWhere("mKey = \(mKey)", orderBy: "", offset: 0, count: 1000)
        let data = NSArray(array: arr) as! [QuestionData]
        
        return data
    }
    
    
    
    

    

    
}
