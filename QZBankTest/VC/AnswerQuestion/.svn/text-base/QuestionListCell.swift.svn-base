//
//  QuestionListCell.swift
//  QZBankTest
//
//  Created by mac on 16/8/7.
//  Copyright © 2016年 com.cn.QZ. All rights reserved.
//

import UIKit

class QuestionListCell: BaseCell {
    
    @IBOutlet weak var questionContentLb: UILabel!
    @IBOutlet weak var markView : UIView!
    @IBOutlet weak var markLb: UILabel!
    @IBOutlet weak var isFnishLb: UILabel!

    @IBOutlet weak var bgViewHeight: NSLayoutConstraint!
//    @IBOutlet weak var questionLbHeight: NSLayoutConstraint!
    
    
    var questionModel:QuestionM!
    
    override func createViews() {
        super.createViews()
        
    }
    
    override func fillData(item:AnyObject,indexPath : NSIndexPath,handle:TableViewHandler){
        super.fillData(item, indexPath: indexPath, handle: handle)
        
        let model = item as! QuestionM
        questionModel = item as! QuestionM
        if model.question == ""  {
            return
        }
        
        questionContentLb.text = String(model.questionid) + "." + model.question
        
        //测试
//        questionContentLb.text = "121212121212"

        let typeClass = ["单选题(主管)","多选题(主管)","判断题(主管)","单选题(柜员)","多选题(柜员)","判断题(柜员)"]
        
        markLb.text = typeClass[(Int(model.typeid)!-1)] + "    " + model.typename
        
        
        let font = UIFont.systemFontOfSize(14)
        let sizepart = CGSizeMake(CV.BaseWidth - 40, 0)
        let stringpart = (questionContentLb.text)!
        let partRect = COAppTool.getRectWithString(stringpart, font: font, size: sizepart)

//        self.questionLbHeight.constant = (partRect?.height)! + 4
        self.bgViewHeight.constant = (partRect?.height)! + 40
        
        if model.errorType == 0{
            isFnishLb.text = "未开始"
        }
        if model.errorType == 1{
            isFnishLb.text = "回答正确"
        }
        if model.errorType == 2{
            isFnishLb.text = "回答错误"
        }
        
        
    }
    
    override func onClickCell(index: NSIndexPath, item: AnyObject,handle:TableViewHandler) -> Bool {
        
        let vc = AnswerQuestionVC()
        vc.isWithXib = true
        
        if questionModel.typeid == "3" || questionModel.typeid == "6"{
            vc.dataAllList = [questionModel,questionModel,questionModel]

        }else{
            vc.dataAllList = [questionModel,questionModel,questionModel,questionModel,questionModel]
        }
        
        vc.question = questionModel
        currentVC?.pushVC(vc)
        
        return true
    }
    
  
    

}
