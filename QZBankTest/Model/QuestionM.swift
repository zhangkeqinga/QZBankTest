//
//  QuestionM.swift
//  QZBankTest
//
//  Created by mac on 16/8/4.
//  Copyright © 2""16年 com.cn.QZ. All rights reserved.
//


import UIKit

//@objc(QuestionM)

class QuestionM: BaseM {
    
    
//    var i_id:Int = 0           //自增长id
    var questionid:Int = 0     //问题id
    var question  :String = "" //问题内容
    
    var typeid  :String = ""   //问题类型id   1 2 3 4 5 6
    var typename:String = ""   //问题名称
    
    var answer_r:String = ""   //正确答案
    var anwser_a:String = ""   //答案A
    var anwser_b:String = ""   //答案B
    var anwser_c:String = ""   //答案C
    var anwser_d:String = ""   //答案D
    
    var errorType:Int = 0   // 0未开始  1正确  2错误
    var collected:Int = 0   // 0未收藏  1收藏
    
    
    override class func getTableName()->String{
        return "QuestionM"
    }
    
    
    
    
}
