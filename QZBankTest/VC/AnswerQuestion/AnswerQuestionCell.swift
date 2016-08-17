//
//  AnswerQuestionCell.swift
//  QZBankTest
//
//  Created by mac on 16/8/7.
//  Copyright © 2016年 com.cn.QZ. All rights reserved.
//

import UIKit

class AnswerQuestionCell: BaseCell {
    
    
    @IBOutlet weak var answerBnt : UIButton!
    @IBOutlet weak var answerContent: UILabel!
    
    
    var questionModel:QuestionM!
    var isAnswer:Bool = false

    @IBOutlet weak var bgViewHeight: NSLayoutConstraint!

    
    let btnDefaultImage = ["grayA","grayB","grayC","grayD","grayA","grayB"]
    let btnRightImage = ["purpleA","purpleB","purpleC","purpleD","purpleA","purpleB"]
    let btnErrorImage = ["redA","redB","redC","redD","redA","redB"]

    let btnSelectImage = ["orangeA","orangeB","orangeC","orangeD","orangeA","orangeB"]

    
    override func createViews() {
        super.createViews()
        
    }
    
    override func fillData(item:AnyObject,indexPath : NSIndexPath,handle:TableViewHandler){
        super.fillData(item, indexPath: indexPath, handle: handle)
        
        let model = item as! QuestionM
        questionModel = item as! QuestionM
        
        
        let answer = [model.anwser_a,model.anwser_b,model.anwser_c,model.anwser_d]
        answerBnt.setImage(UIImage(named: btnDefaultImage[indexPath.row-1])!)
        answerContent.text = answer[indexPath.row-1]
        
        
        let font = UIFont.systemFontOfSize(15)
        let sizepart = CGSizeMake(CV.BaseWidth - 74, 0)
        let stringpart = (answerContent.text)!
        let partRect = COAppTool.getRectWithString(stringpart, font: font, size: sizepart)
        
        answerContent.frame = CGRectMake(54, 12, CV.BaseWidth - 54 - 20, (partRect?.size.height)!)

        self.bgViewHeight.constant = (partRect?.height)! + 26
        
        
        if UserShareInstance.getSharedInstance().learnMode {
            if indexPath.row == 1 && model.answer_r.containsString("A") {
                answerBnt.setImage(UIImage(named: btnRightImage[indexPath.row-1])!)
            }
            if indexPath.row == 2  && model.answer_r.containsString("B") {
                answerBnt.setImage(UIImage(named: btnRightImage[indexPath.row-1])!)
            }
            if indexPath.row == 3  && model.answer_r.containsString("C"){
                answerBnt.setImage(UIImage(named: btnRightImage[indexPath.row-1])!)
            }
            if indexPath.row == 4  && model.answer_r.containsString("D"){
                answerBnt.setImage(UIImage(named: btnRightImage[indexPath.row-1])!)
            }
            
        }else{
           
            if isAnswer {
                answerBnt.setImage(UIImage(named: btnSelectImage[indexPath.row - 1])!)
            }else{
                answerBnt.setImage(UIImage(named: btnDefaultImage[indexPath.row - 1])!)
            }

        }
        
        
        
    }
    
    
    override func onClickCell(index: NSIndexPath, item: AnyObject,handle:TableViewHandler) -> Bool
    {
        
        
        if UserShareInstance.getSharedInstance().learnMode { // 学习模式禁止点击
        }else{
            
            let indexs = index.row - 1
            var isAnswerNum = 0

            isAnswer = !isAnswer
            if isAnswer {
                isAnswerNum = 1
                answerBnt.setImage(UIImage(named: btnSelectImage[index.row - 1])!)
            }else{
                isAnswerNum = 0
                answerBnt.setImage(UIImage(named: btnDefaultImage[index.row - 1])!)
            }
            
            let array = [indexs,isAnswerNum]
            
            CU.notifyPost("NN_Notification_answerQuestion", o: array)
            
            
        }
        
        
        
//        if Int(questionModel.answer_r)! - Int("A")! == index.row - 1 {
//            //正确
//        }else{
//            
//        }
        
        return true
    }
    
    

    
    
}
