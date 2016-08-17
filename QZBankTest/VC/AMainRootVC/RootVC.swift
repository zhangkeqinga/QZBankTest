//
//  RootVC.swift
//  QZBankTest
//
//  Created by mac on 16/8/6.
//  Copyright © 2016年 com.cn.QZ. All rights reserved.
//

import UIKit

class RootVC: BaseVC,UITableViewDataSource,UITableViewDelegate{
    
    let CellIdCell = "RootCell"//cell id
    
    @IBOutlet weak var tableview: UITableView!
    
    var dataAllList:[UserQuestionM] = []
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.navigationController!.navigationBarHidden = true
        self.tabBarController!.tabBar.hidden = false
        CU.notifyPost("secondtabBarFootViewShow")

        self.getDataNumber()

    }
    
    
    override func createViews() {
        super.createViews()
        self.title = "农业银行知识库"
        
        self.tableview.registerNib(UINib(nibName: "RootCell", bundle: nil), forCellReuseIdentifier: CellIdCell)
        
        self.tableview.clearFootV()
        self.tableview.clearSeparator()
        self.tableview.backgroundColor = UIColor.clearColor()

        self.performSelector(#selector(RootVC.getDataNumber), withObject: nil, afterDelay: 1)
    }
    

    
    
    func getDataNumber(){
        let model = UserQuestionM()
        
        model.userType = 1
//        model.singleNumber       = 1397
//        model.moreNumber         = 1013
//        model.judgeNumber        = 572
        
        model.singleNumber       = QuestionData().queryAllDirectorSingleQuestionDataCount()
        model.moreNumber         = QuestionData().queryAllDirectorMoreQuestionDataCount()
        model.judgeNumber        = QuestionData().queryAllDirectorJudgeQuestionDataCount()

        
        model.singleFishNumber  = QuestionData().queryAllDirectorSingleFinishCount().1
        model.moreFishNumber     = QuestionData().queryAllDirectorMoreFinishCount().1
        model.judgeFishNumber    = QuestionData().queryAllDirectorJudgeFinishCount().1
        
        model.collectNumber      = QuestionData().queryColectionDirectorQuestionFromTabel_zgCount()
        model.errorNumber        = QuestionData().queryErrorDirectorQuestionFromTabel_zgCount()
        
        let model2 = UserQuestionM()
        model2.userType = 2
        
//        model2.singleNumber       = 851
//        model2.moreNumber         = 666
//        model2.judgeNumber        = 549
        
        model2.singleNumber       = QuestionData().queryAllCounterSingleQuestionDataCount()
        model2.moreNumber         = QuestionData().queryAllCounterMoreQuestionDataCount()
        model2.judgeNumber        = QuestionData().queryAllCounterJudgeQuestionDataCount()
        
        
        model2.singleFishNumber  = QuestionData().queryAllCounterSingleFinishCount().1
        model2.moreFishNumber     = QuestionData().queryAllCounterMoreFinishCount().1
        model2.judgeFishNumber    = QuestionData().queryAllCounterJudgeFinishCount().1
        
        model2.collectNumber      = QuestionData().queryColectionCounterQuestionFromTabel_gtCount()
        model2.errorNumber        = QuestionData().queryErrorCounterQuestionFromTabel_gtCount()
        
        
        
        dataAllList = []
        dataAllList.append(model)
        dataAllList.append(model2)

        if self.tableview != nil {
            self.tableview.reloadData()
        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        
    }
    
    
    @IBAction func OnClickActionNextVC(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let myPersonnelListVC = MainTabBarVC()
        appDelegate.navgationVC?.pushViewController(myPersonnelListVC, animated: true)
        appDelegate.navgationVC?.navigationBarHidden = true
        
    }
    
    
    
    
    //MARK: tableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataAllList.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        if dataAllList.count <= indexPath.row {
            return 0
        }
        return 209
    }
    
    
    // 根据indexPath获取指定cell的item
    private func getCellItem(indexPath: NSIndexPath)->AnyObject {
        var item :AnyObject?
        item = dataAllList[indexPath.row]
        return item!
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell:RootCell = tableView.dequeueReusableCellWithIdentifier("RootCell",forIndexPath: indexPath) as! RootCell
        
        cell.fillData(getCellItem(indexPath), indexPath: indexPath, handle: tableView.handler())

        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
    }

    func checkEvaluate(button:UIButton){
        
    }
    

    

}
