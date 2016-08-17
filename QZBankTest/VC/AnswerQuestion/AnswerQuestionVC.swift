//
//  AnswerQuestionVC.swift
//  QZBankTest
//
//  Created by mac on 16/8/7.
//  Copyright © 2016年 com.cn.QZ. All rights reserved.
//

import UIKit

class AnswerQuestionVC: BaseVC,UITableViewDataSource,UITableViewDelegate{

    let CellIdCell = "QuestionListCell"//cell id
    let CellIdCell2 = "AnswerQuestionCell"//cell id

    var questionTableType:Int = 0  //主管 柜员
    var questionType:Int = 0       //选择 判断
    
    var dataAllList:[QuestionM] = []
    var questions:NSArray!
    var question:QuestionM!
    var answers  = [0,0,0,0]
    
    @IBOutlet weak var originXConstrant: NSLayoutConstraint!

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var lineV: UIView!
    @IBOutlet weak var starImg: UIImageView!
    @IBOutlet weak var percentBtn: UIButton!


    private let cellTypes:[BaseCell.Type] = [QuestionListCell.self,AnswerQuestionCell.self]

    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController!.navigationBarHidden = false
        self.tabBarController!.tabBar.hidden = true
        CU.notifyPost("secondtabBarFootViewHiden")

        self.changeLineViewFrame()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.changeLineViewFrame()
        
    }

    
    override func createViews() {
        super.createViews()
        self.title = "农业银行知识库"
        
        questions = NSArray()
        
        for cellType in cellTypes {
            cellType.registerCellNib(tableview)
        }

        if question.collected == 0{ //未收藏
            starImg.setImageWithName("star01")
        }
        if question.collected == 1{//收藏
            starImg.setImageWithName("star02")
        }

        CU.notifyAdd(self, nofityName: "NN_Notification_answerQuestion", selectorName: "answerquestion:")
        
        //读取数据库
        self.queryData()
        
    }
    
    
    
    
    func changeLineViewFrame(){
        if UserShareInstance.getSharedInstance().learnMode {
            originXConstrant.constant = (CV.BaseWidth-1)/2 + 1
        } else{
            originXConstrant.constant = 0
        }
        
    }

    
    func  answerquestion(noti:NSNotification){
        
        let array = noti.object as! NSArray
        let index = array[0] as! Int
        let isAnswerNum = array[1]  as! Int
        if isAnswerNum == 1 {
            answers[index] = 1
        }else{
            answers[index] = 0
        }
        
    }
    
    //查询所有单选题
    func queryData(){
        if question.typeid == "1" {
            questions = QuestionData().queryAllDirectorSingleQuestionData()
        }
        else if question.typeid == "2" {
            questions = QuestionData().queryAllDirectorMoreQuestionData()
        }
        else if question.typeid == "3" {
            questions = QuestionData().queryAllDirectorJudgeQuestionData()
        }
        else if question.typeid == "4" {
            questions = QuestionData().queryAllCounterSingleQuestionData()
        }
        else if question.typeid == "5" {
            questions = QuestionData().queryAllCounterMoreQuestionData()
        }
        else if question.typeid == "6" {
            questions = QuestionData().queryAllCounterJudgeQuestionData()
        }else{
            
        }

        
        if questions.count > 0 {
            percentBtn.setTitle(String(question.questionid) + "/" + String(questions.count))
        }
    }
    
    
    
    func queryNextQuestion(){
        let model = dataAllList[0]
        if model.questionid >= questions.count{
            currentVC?.alert("已经是最后一题了！")
            return
        }
        
        question = QuestionData().queryNextData(model, i_id: model.questionid + 1)
        
        if question.collected == 0{ //未收藏
            starImg.setImageWithName("star01")
        }
        if question.collected == 1{//收藏
            starImg.setImageWithName("star02")
        }

        self.getDataList()
    }
    
    
    func queryBeforeQuestion(){
        let model = dataAllList[0]
        if model.questionid <= 1{
            currentVC?.alert("已经是第一题了！")
            return
        }
        question = QuestionData().queryNextData(model, i_id:model.questionid - 1)
       
        if question.collected == 0{ //未收藏
            starImg.setImageWithName("star01")
        }
        if question.collected == 1{//收藏
            starImg.setImageWithName("star02")
        }

        self.getDataList()
    }

    
    
    func getDataList(){
        
        if question.anwser_a != "null" && question.anwser_b != "null" && question.anwser_c != "null" && question.anwser_d != "null" {
            dataAllList = [question!,question!,question!,question!,question!]
            
        }else if question.anwser_a != "null" && question.anwser_b != "null" && question.anwser_c != "null" && question.anwser_d == "null" {
            dataAllList = [question!,question!,question!,question!]
            
        }else if question.anwser_a != "null" && question.anwser_b != "null" && question.anwser_c == "null" && question.anwser_d == "null" {
            dataAllList = [question!,question!,question!]
            
        }else if question.anwser_a != "null" && question.anwser_b != "null" && question.anwser_c == "null" && question.anwser_d == "null" {
            dataAllList = [question!,question!]
       
        }else if question.anwser_a != "null" && question.anwser_b != "null" && question.anwser_c == "null" && question.anwser_d == "null" {
            dataAllList = [question!]
       
        }else{
            dataAllList = [question!]
        }
        
        
    }
    

    //MARK: selecteQuestionOrAnswerType
    @IBAction func selecteQuestionOrAnswerType(button:UIButton){
        self.lineV.frame = CGRectMake(button.frame.origin.x, self.lineV.frame.origin.y, self.lineV.frame.size.width, self.lineV.frame.size.height)
        
        let index = button.tag - 4100
        
        if index == 0 {
            UserShareInstance.getSharedInstance().learnMode = false
        }else{
            UserShareInstance.getSharedInstance().learnMode = true
        }
        self.tableview.reloadData()
        
    }
    
    //MARK: selecteQuestionOrAnswerType
    @IBAction func nextQuestion(button:UIButton){
        answers  = [0,0,0,0]
        self.queryNextQuestion()
        self.tableview.reloadData()
        if questions.count > 0 {
            percentBtn.setTitle(String(question.questionid) + "/" + String(questions.count))
        }

    }

    @IBAction func beforeQuestion(button:UIButton){
        answers  = [0,0,0,0]
        self.queryBeforeQuestion()
        self.tableview.reloadData()
        if questions.count > 0 {
            percentBtn.setTitle(String(question.questionid) + "/" + String(questions.count))
        }

    }


    
    //收藏
    @IBAction func onClickCollectionQuestionAction(button:UIButton){
        
        let tableNames = ["single_question_zg","more_question_zg","judge_question_zg","single_question_gt","more_question_gt","judge_question_gt"]

        if Int(question.typeid)! < 0 || Int(question.typeid)! > 5 {
            return
        }
        
        if question.collected == 0{
            question.collected = 1//收藏
        }else {
            question.collected = 0//取消收藏
        }
        
        let tableName = tableNames[Int(question.typeid)! - 1]
        BKDBManager.sharedInstance.updataDataQuestionM(tableName, model: question)
        
        if question.collected == 0{ //未收藏
            starImg.setImageWithName("star01")
        }else{ //收藏
            starImg.setImageWithName("star02")
        }

        
    }
    
    
    //提交答案
    @IBAction func onClickCommitAnswerAction(button:UIButton){
        
        let tableNames = ["single_question_zg","more_question_zg","judge_question_zg","single_question_gt","more_question_gt","judge_question_gt"]

        var answerStr = ""
        var answerContent = ""

        for (index,iteam) in answers.enumerate() {
            
            if index == 0  && iteam == 1 {
                answerStr = answerStr + "A"
            }
            if index == 1  && iteam == 1 {
                answerStr = answerStr + "B"
            }
            if index == 2  && iteam == 1 {
                answerStr = answerStr + "C"
            }
            if index == 3  && iteam == 1 {
                answerStr = answerStr + "D"
            }
        }
        
        if answerStr == "" {
            currentVC?.alert("请选择答案")
            return
        }
        
        for awr in question.answer_r.characters {
            
            if awr == "A" {
                answerContent =  "A、" + "\(question.anwser_a)" + "\n"
            }
            if awr == "B" {
                answerContent = answerContent + "B、" + "\(question.anwser_b)" + "\n"
            }
            if awr == "C" {
                answerContent = answerContent + "C、" + "\(question.anwser_c)" + "\n"
            }
            if awr == "D" {
                answerContent = answerContent + "D、" + "\(question.anwser_d)" + "\n"
            }
            
        }
        
        let tablename = tableNames[Int(question.typeid)! - 1] 
        
        if question.answer_r == answerStr {
//            currentVC?.alert("恭喜你答对了")
            let arrayNot = ["恭喜您答对了!","你太棒了!","又被你答对了","你太厉害了","正确","正确","正确","正确","你太棒了!","正确"]
            let strings = arrayNot[Int(rand())%9] 
            currentVC?.alert22(strings, handler: {
                let btn = UIButton()
                self.nextQuestion(btn)
            })
            
            question.errorType = 1
            QuestionData().updataQuestionDataWithTable(tablename, model: question)

        }else {
            
            question.errorType = 2
            QuestionData().updataQuestionDataWithTable(tablename, model: question)

            currentVC?.alert("正确答案是:\n\(answerContent)" )
        }
        
        
    }
    
    


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
//    答题模式  学习模式
    
//    所有数据表 收藏数据表  已完成数据表  错误数据表
//    X 用户表当前完成到第几题 X
//
    
    
    //MARK: tableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataAllList.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{

        var mClass = cellTypes[0]
        if indexPath.row > 0 {
            mClass = cellTypes[1]
        }
        return mClass.getHeightWithItem(getCellItem(indexPath), indexPath: indexPath, tableView: self.tableview, isInternalCell: false, handle: self.tableview.handler())


        
    }
    
    
    // 根据indexPath获取指定cell的item
    private func getCellItem(indexPath: NSIndexPath)->AnyObject {
        var item :AnyObject?
        item = dataAllList[indexPath.row]
        return item!
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        if indexPath.row == 0 {
            let cell:QuestionListCell = tableView.dequeueReusableCellWithIdentifier(CellIdCell,forIndexPath: indexPath) as! QuestionListCell
            
            cell.fillData(getCellItem(indexPath), indexPath: indexPath, handle: tableView.handler())
            
            return cell
            
        }else{
            
            let cell:AnswerQuestionCell = tableView.dequeueReusableCellWithIdentifier(CellIdCell2,forIndexPath: indexPath) as! AnswerQuestionCell
            
            cell.isAnswer = answers[indexPath.row - 1] > 0 ? true : false

            cell.fillData(getCellItem(indexPath), indexPath: indexPath, handle: tableView.handler())
            
            return cell
            
        }
        
        
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        if indexPath.row == 0 {
        
        }else{
            
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! COBaseCell
            cell.onClickCell(indexPath, item: getCellItem(indexPath),handle:tableView.handler())
            
            
            
        }
        
        
        
    }
    

    
    
    
    
    

}