//
//  QuestionData.swift
//  QZBankTest
//
//  Created by mac on 16/8/6.
//  Copyright © 2016年 com.cn.QZ. All rights reserved.
//

import UIKit

class QuestionData: NSObject {
    
    
    //MARK: //single_question_zg
    let tablename11 = "single_question_zg"
    //查询
    func queryAllDirectorSingleQuestionData()->NSMutableArray{
        var datas = NSMutableArray()
        datas = BKDBManager.sharedInstance.queryDataAllQuestionM(tablename11)
        return datas
    }
    
    func queryAllDirectorSingleQuestionDataCount()->Int{
        let datas = self.queryAllDirectorSingleQuestionData()
        return datas.count
    }
    
    func queryAllDirectorSingleFinishCount()->(NSMutableArray,Int){
        
        var datas = NSMutableArray()
        datas = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename11, fieldKey: "errorType", fieldContent: "1")
        
        var datas2 = NSMutableArray()
        datas2 = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename11, fieldKey: "errorType", fieldContent: "2")
        
        let collectArray = NSMutableArray()
        collectArray.addObjectsFromArray(datas as [AnyObject])
        collectArray.addObjectsFromArray(datas2 as [AnyObject])
        
        return (collectArray,collectArray.count)
        
    }


    
    func queryDirectorSingleQuestionData(i_id:Int) -> QuestionM?{
        let model = BKDBManager.sharedInstance.queryDataQuestionM(i_id, tableNmae: tablename11)
        if model.questionid == 0 {
            return nil
        }
        return model
    }
    
    //更新
    func updataDirectorSingleQuestionData(model:QuestionM) {
        BKDBManager.sharedInstance.updataDataQuestionM(tablename11, model: model)
    }
    
    
    
    //MARK: //more_question_zg
    let tablename12 = "more_question_zg"
    //查询
    func queryAllDirectorMoreQuestionData()->NSMutableArray{
        var datas = NSMutableArray()
        datas = BKDBManager.sharedInstance.queryDataAllQuestionM(tablename12)
        return datas
    }
    func queryAllDirectorMoreQuestionDataCount()->Int{
        let datas = self.queryAllDirectorMoreQuestionData()
        return datas.count
    }

    func queryAllDirectorMoreFinishCount()->(NSMutableArray,Int){
        
        var datas = NSMutableArray()
        datas = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename12, fieldKey: "errorType", fieldContent: "1")
        
        var datas2 = NSMutableArray()
        datas2 = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename12, fieldKey: "errorType", fieldContent: "2")
        
        let collectArray = NSMutableArray()
        collectArray.addObjectsFromArray(datas as [AnyObject])
        collectArray.addObjectsFromArray(datas2 as [AnyObject])
        
        return (collectArray,collectArray.count)
        
    }

    
    func queryDirectorMoreQuestionData(i_id:Int) -> QuestionM?{
        let model = BKDBManager.sharedInstance.queryDataQuestionM(i_id, tableNmae: tablename12)
        if model.questionid == 0 {
            return nil
        }
        return model
    }
    //更新
    func updataDirectorMoreQuestionData(model:QuestionM) {
        BKDBManager.sharedInstance.updataDataQuestionM(tablename12, model: model)
    }

    
    //MARK: //judge_question_zg
    let tablename13 = "judge_question_zg"
    //查询
    func queryAllDirectorJudgeQuestionData()->NSMutableArray{
        var datas = NSMutableArray()
        datas = BKDBManager.sharedInstance.queryDataAllQuestionM(tablename13)
        return datas
    }
    func queryAllDirectorJudgeQuestionDataCount()->Int{
        let datas = self.queryAllDirectorJudgeQuestionData()
        return datas.count
    }

    func queryAllDirectorJudgeFinishCount()->(NSMutableArray,Int){
        
        var datas = NSMutableArray()
        datas = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename13, fieldKey: "errorType", fieldContent: "1")
        
        var datas2 = NSMutableArray()
        datas2 = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename13, fieldKey: "errorType", fieldContent: "2")
        
        let collectArray = NSMutableArray()
        collectArray.addObjectsFromArray(datas as [AnyObject])
        collectArray.addObjectsFromArray(datas2 as [AnyObject])
        
        return (collectArray,collectArray.count)
        
    }

    
    func queryDirectorJudgeQuestionData(i_id:Int) -> QuestionM?{
        let model = BKDBManager.sharedInstance.queryDataQuestionM(i_id, tableNmae: tablename13)
        if model.questionid == 0 {
            return nil
        }
        return model
    }
    //更新
    func updataDirectorJudgeQuestionData(model:QuestionM) {
        BKDBManager.sharedInstance.updataDataQuestionM(tablename13, model: model)
    }
    
    
    func updataALlQuestionDataWithTable(table:String,model:QuestionM) {
        self.updataQuestionDataWithTable(table, model: model)

    }


    
    //MARK:多表查询  收藏 错误
    
    
    
    //
    func queryColectionDirectorQuestionFromTabel_zg()->NSMutableArray{
        
        var datas = NSMutableArray()
        datas = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename11, fieldKey: "collected", fieldContent: "1")
        
        var datas2 = NSMutableArray()
        datas2 = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename12, fieldKey: "collected", fieldContent: "1")

        var datas3 = NSMutableArray()
        datas3 = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename13, fieldKey: "collected", fieldContent: "1")
        
        
        let collectArray = NSMutableArray()
        collectArray.addObjectsFromArray(datas as [AnyObject])
        collectArray.addObjectsFromArray(datas2 as [AnyObject])
        collectArray.addObjectsFromArray(datas3 as [AnyObject])
        
        
        return collectArray
        
    }
    
    
    //
    func queryColectionDirectorQuestionFromTabel_zgCount()->Int{
        let datas = self.queryColectionDirectorQuestionFromTabel_zg()
        return datas.count
    }
    

    
    //错误
    func queryErrorDirectorQuestionFromTabel_zg()->NSMutableArray{
        
        
        var datas = NSMutableArray()
        datas = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename11, fieldKey: "errorType", fieldContent: "2")
        
        var datas2 = NSMutableArray()
        datas2 = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename12, fieldKey: "errorType", fieldContent: "2")
        
        var datas3 = NSMutableArray()
        datas3 = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename13, fieldKey: "errorType", fieldContent: "2")
        
        
        let collectArray = NSMutableArray()
        collectArray.addObjectsFromArray(datas as [AnyObject])
        collectArray.addObjectsFromArray(datas2 as [AnyObject])
        collectArray.addObjectsFromArray(datas3 as [AnyObject])
        
        return collectArray

    }

    //错误
    func queryErrorDirectorQuestionFromTabel_zgCount()->Int{
        let datas = self.queryErrorDirectorQuestionFromTabel_zg()
        return datas.count
        
    }
    

    
    
    //MARK: //single_question_gt
    let tablename21 = "single_question_gt"
    
    //查询
    func queryAllCounterSingleQuestionData()->NSMutableArray{
        var datas = NSMutableArray()
        datas = BKDBManager.sharedInstance.queryDataAllQuestionM(tablename21)
        return datas
    }
    
    func queryAllCounterSingleQuestionDataCount()->Int{
        let datas = self.queryAllCounterSingleQuestionData()
        return datas.count
    }
    
    func queryAllCounterSingleFinishCount()->(NSMutableArray,Int){
        
        var datas = NSMutableArray()
        datas = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename21, fieldKey: "errorType", fieldContent: "1")
        
        var datas2 = NSMutableArray()
        datas2 = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename21, fieldKey: "errorType", fieldContent: "2")
        
        let collectArray = NSMutableArray()
        collectArray.addObjectsFromArray(datas as [AnyObject])
        collectArray.addObjectsFromArray(datas2 as [AnyObject])
        
        return (collectArray,collectArray.count)
        
    }

    
    func queryCounterSingleQuestionData(i_id:Int) -> QuestionM?{
        let model = BKDBManager.sharedInstance.queryDataQuestionM(i_id, tableNmae: tablename21)
        if model.questionid == 0 {
            return nil
        }
        return model
    }
    //更新
    func updataCounterSingleQuestionData(model:QuestionM) {
        BKDBManager.sharedInstance.updataDataQuestionM(tablename21, model: model)
    }
    

    //MARK: //more_question_gt
    let tablename22 = "more_question_gt"
    //查询
    func queryAllCounterMoreQuestionData()->NSMutableArray{
        var datas = NSMutableArray()
        datas = BKDBManager.sharedInstance.queryDataAllQuestionM(tablename22)
        return datas
    }
    func queryAllCounterMoreQuestionDataCount()->Int{
        let datas = self.queryAllCounterMoreQuestionData()
        return datas.count
    }
    func queryAllCounterMoreFinishCount()->(NSMutableArray,Int){
        
        var datas = NSMutableArray()
        datas = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename22, fieldKey: "errorType", fieldContent: "1")
        
        var datas2 = NSMutableArray()
        datas2 = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename22, fieldKey: "errorType", fieldContent: "2")
        
        let collectArray = NSMutableArray()
        collectArray.addObjectsFromArray(datas as [AnyObject])
        collectArray.addObjectsFromArray(datas2 as [AnyObject])
        
        return (collectArray,collectArray.count)
        
    }

    
    func queryCounterMoreQuestionData(i_id:Int) -> QuestionM?{
        let model = BKDBManager.sharedInstance.queryDataQuestionM(i_id, tableNmae: tablename22)
        if model.questionid == 0 {
            return nil
        }
        return model
    }
    //更新
    func updataCounterMoreQuestionData(model:QuestionM) {
        BKDBManager.sharedInstance.updataDataQuestionM(tablename22, model: model)
    }
    
    
    //MARK: //judge_question_gt
    let tablename23 = "judge_question_gt"
    //查询
    func queryAllCounterJudgeQuestionData()->NSMutableArray{
        var datas = NSMutableArray()
        datas = BKDBManager.sharedInstance.queryDataAllQuestionM(tablename23)
        return datas
    }
    func queryAllCounterJudgeQuestionDataCount()->Int{
        let datas = self.queryAllCounterJudgeQuestionData()
        return datas.count
    }
    
    func queryAllCounterJudgeFinishCount()->(NSMutableArray,Int){
        
        var datas = NSMutableArray()
        datas = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename23, fieldKey: "errorType", fieldContent: "1")
        
        var datas2 = NSMutableArray()
        datas2 = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename23, fieldKey: "errorType", fieldContent: "2")
        
        let collectArray = NSMutableArray()
        collectArray.addObjectsFromArray(datas as [AnyObject])
        collectArray.addObjectsFromArray(datas2 as [AnyObject])
        
        return (collectArray,collectArray.count)
        
    }


    
    func queryCounterJudgeQuestionData(i_id:Int) -> QuestionM?{
        let model = BKDBManager.sharedInstance.queryDataQuestionM(i_id, tableNmae: tablename23)
        if model.questionid == 0 {
            return nil
        }
        return model
    }
    //更新
    func updataCounterJudgeQuestionData(model:QuestionM) {
        BKDBManager.sharedInstance.updataDataQuestionM(tablename23, model: model)
    }
    
    
    //MARK:多表查询
    //搜藏
    func queryColectionCounterQuestionFromTabel_gt()->NSMutableArray{
        
        var datas = NSMutableArray()
        datas = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename21, fieldKey: "collected", fieldContent: "1")
        
        var datas2 = NSMutableArray()
        datas2 = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename22, fieldKey: "collected", fieldContent: "1")
        
        var datas3 = NSMutableArray()
        datas3 = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename23, fieldKey: "collected", fieldContent: "1")
        
        
        let collectArray = NSMutableArray()
        collectArray.addObjectsFromArray(datas as [AnyObject])
        collectArray.addObjectsFromArray(datas2 as [AnyObject])
        collectArray.addObjectsFromArray(datas3 as [AnyObject])
        
        
        return collectArray
        
    }
    
    func queryColectionCounterQuestionFromTabel_gtCount()->Int{
        let datas = self.queryColectionCounterQuestionFromTabel_gt()
        return datas.count
    }

    
    //错误
    func queryErrorCounterQuestionFromTabel_gt()->NSMutableArray{
        
        var datas = NSMutableArray()
        datas = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename21, fieldKey: "errorType", fieldContent: "2")
        
        var datas2 = NSMutableArray()
        datas2 = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename22, fieldKey: "errorType", fieldContent: "2")
        
        var datas3 = NSMutableArray()
        datas3 = BKDBManager.sharedInstance.queryDataQuestionMWithField(tablename23, fieldKey: "errorType", fieldContent: "2")
        
        
        let collectArray = NSMutableArray()
        collectArray.addObjectsFromArray(datas as [AnyObject])
        collectArray.addObjectsFromArray(datas2 as [AnyObject])
        collectArray.addObjectsFromArray(datas3 as [AnyObject])
        
        return collectArray
        
    }
    
    func queryErrorCounterQuestionFromTabel_gtCount()->Int{
        let datas = self.queryErrorCounterQuestionFromTabel_gt()
        return datas.count
        
    }

    
    
    //MARK:根据表名进行数据查询
    func queryNextQuestionData(table:String,i_id:Int) -> QuestionM?{
        let model = BKDBManager.sharedInstance.queryDataQuestionM(i_id, tableNmae: table)
        if model.questionid == 0 {
            return nil
        }
        return model
    }
    
    func queryNextData(questionM:QuestionM,i_id:Int) -> QuestionM?{
        
        let tableNames = ["single_question_zg","more_question_zg","judge_question_zg","single_question_gt","more_question_gt","judge_question_gt"]
        
        let tableName = tableNames[Int(questionM.typeid)! - 1]
        let model = self.queryNextQuestionData(tableName, i_id: i_id)
        
        return model
        
        
    }
    

    //搜藏
    func queryCounts(table:String,fieldKey:String,fieldContent:String)-> Int{
        let num = BKDBManager.sharedInstance.queryDataQuestionMAllCount(table, fieldKey: fieldKey, fieldContent: fieldContent)
        return num
        
    }
    
    
    
    
    
    //
    func queryCountNumber(questionM:QuestionM,fieldKey:String,fieldContent:String)-> Int{
        
        let tableNames = ["single_question_zg","more_question_zg","judge_question_zg","single_question_gt","more_question_gt","judge_question_gt"]
        
        let tableName = tableNames[Int(questionM.typeid)! - 1]
        let num = BKDBManager.sharedInstance.queryDataQuestionMAllCount(tableName, fieldKey: fieldKey, fieldContent: fieldContent)
        
        return num
        
    }
    
    
    

    
    
    //MARK:根据表名进行数据更新
    func updataQuestionDataWithTable(table:String ,model:QuestionM) {
        BKDBManager.sharedInstance.updataDataQuestionM(table, model: model)
    }
    
    
    
    
}
