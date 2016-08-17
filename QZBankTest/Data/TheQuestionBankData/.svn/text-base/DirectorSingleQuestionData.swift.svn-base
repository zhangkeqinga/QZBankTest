//
//  DirectorSingleQuestionData.swift
//  QZBankTest
//
//  Created by mac on 16/8/6.
//  Copyright © 2016年 com.cn.QZ. All rights reserved.
//

import UIKit

class DirectorSingleQuestionData: NSObject {
    
    let tablename = "single_question_gt" //主管单选题
    
    func queryAllDirectorSingleQuestionData()->NSMutableArray{
        var datas = NSMutableArray()
        datas = BKDBManager.sharedInstance.queryDataAllQuestionM(tablename)
        return datas
    }
    
    
    
    
}
