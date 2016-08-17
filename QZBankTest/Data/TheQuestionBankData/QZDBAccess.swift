//
//  QZDBAccess.swift
//  QZBankTest
//
//  Created by mac on 16/8/6.
//  Copyright © 2016年 com.cn.QZ. All rights reserved.
//

import UIKit

class QZDBAccess {

    static let sharedInstance = QZDBAccess()
    var db:FMDatabase?

    private init() {
        log("OKOKOKL = \(COFileTool.documentFilePathWithFileName("TheQuestionBank.db"))")
    }
    
    func runSQL(sqlStr:AnyObject){
        
    }
//    
//    func queryDataToObjArrary(sqlStr:String,type:AnyClass) -> NSMutableArray{
//        
//    }
//    
//    func queryDataToObj(sqlStr:String,type:AnyClass) -> AnyObject{
//        
//    }
//
//    func queryDataToArray(sqlStr:String) -> NSMutableArray{
//        
//    }
//    
//    func queryDataToDictionary(sqlStr:String) -> NSMutableArray{
//        
//    }

    
    
    
}
