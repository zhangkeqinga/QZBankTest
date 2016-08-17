//
//  QuestionListVC.swift
//  QZBankTest
//
//  Created by mac on 16/8/7.
//  Copyright © 2016年 com.cn.QZ. All rights reserved.
//  题目列表

import UIKit
import CoreLocation

class QuestionListVC: BaseVC,UITableViewDataSource,UITableViewDelegate,LocationServiceDelegate{
    
    let CellIdCell = "QuestionListCell"//cell id
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var lineV: UIView!

    @IBOutlet weak var titleLb: UILabel!

    @IBOutlet weak var originXConstrant: NSLayoutConstraint!
    var indexType:Int = 0
    
    var dataAllList:NSArray!
    var userQuestionM:UserQuestionM!
    var btnTag:Int = 0
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController!.navigationBarHidden = false
        self.tabBarController!.tabBar.hidden = true
        CU.notifyPost("secondtabBarFootViewHiden")

        self.changeLineViewFrame(btnTag%3)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.changeLineViewFrame(btnTag%3)
    }
    
    override func createViews() {
        super.createViews()
        self.title = "农业银行知识库"
        
        dataAllList = NSArray()
        
        
        for cellType in cellTypes {
            cellType.registerCellNib(self.tableview)
        }

        self.tableview.clearFootV()
        self.tableview.clearSeparator()
        self.tableview.backgroundColor = UIColor.clearColor()
        
        self.changeLineViewFrame(btnTag%3)
        
        
        titleLb.hidden = true
        self.fromDBData()
        
        
        //原生定位
        LocationService.sharedInstance.delegate = self
        LocationService.sharedInstance.startUpdatingLocation()
        

        
    }
    
    
    //delegate
    func tracingLocation(currentLocation: CLLocation){
        
        
        LocationService.sharedInstance.stopUpdatingLocation()
    }
    
    func tracingLocationDidFailWithError(error: NSError){
        
    }

    
    func changeLineViewFrame(index:Int){
        if index == 0 {
            originXConstrant.constant = 0
        }
        if index == 1 {
            originXConstrant.constant = (CV.BaseWidth-2)/3 + 1
        }
        if index == 2 {
            originXConstrant.constant = 2*(CV.BaseWidth-2)/3 + 2
        }
        
    }
    
    
    func fromDBData(){
        //主管 单选
        //多选
        //判断
        //错误
        //收藏
        
        if userQuestionM.userType == 1 {
            if btnTag == 0 {
                self.queryData()
            }
            if btnTag == 1 {
                self.queryData11()
            }
            if btnTag == 2 {
                self.queryData12()
            }
            if btnTag == 3 {
                titleLb.hidden = false
                titleLb.text = "错题收集"
                self.queryData13()
            }
            if btnTag == 4 {
                titleLb.hidden = false
                titleLb.text = "收藏"
                self.queryData14()
            }
            
        }
        if userQuestionM.userType == 2 {
            if btnTag == 0 {
                self.queryData20()
            }
            if btnTag == 1 {
                self.queryData21()
            }
            if btnTag == 2 {
                self.queryData22()
            }
            if btnTag == 3 {
                titleLb.hidden = false
                titleLb.text = "错题收集"
                self.queryData23()
            }
            if btnTag == 4 {
                
                titleLb.hidden = false
                titleLb.text = "收藏"
                self.queryData24()
            }
            
        }
        
        self.tableview.reloadData()


    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    //MARK: selecteQuestionType
    @IBAction func selecteQuestionType(button:UIButton){
        
        self.lineV.frame = CGRectMake(button.frame.origin.x, self.lineV.frame.origin.y, self.lineV.frame.size.width, self.lineV.frame.size.height)
        let index = button.tag - 3100
        indexType = index
        btnTag = indexType
        
        self.fromDBData()
    }
    
    
    //查询所有单选题
    func queryData(){
        dataAllList = QuestionData().queryAllDirectorSingleQuestionData()
    }
    
    func queryData11(){
        dataAllList = QuestionData().queryAllDirectorMoreQuestionData()
        
    }
    
    func queryData12(){
        dataAllList = QuestionData().queryAllDirectorJudgeQuestionData()

    }

    func queryData13(){
        dataAllList = QuestionData().queryErrorDirectorQuestionFromTabel_zg()

    }

    func queryData14(){
        dataAllList = QuestionData().queryColectionDirectorQuestionFromTabel_zg()

    }
    
    func queryData20(){
        dataAllList = QuestionData().queryAllCounterSingleQuestionData()

    }
    
    func queryData21(){
        dataAllList = QuestionData().queryAllCounterMoreQuestionData()

    }
    
    func queryData22(){
        dataAllList = QuestionData().queryAllCounterJudgeQuestionData()

    }

    func queryData23(){
        dataAllList = QuestionData().queryErrorCounterQuestionFromTabel_gt()

    }

    func queryData24(){
        dataAllList = QuestionData().queryColectionCounterQuestionFromTabel_gt()

    }
    
    
    //MARK: tableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataAllList.count
    }
    
    
    private let cellTypes:[BaseCell.Type] = [QuestionListCell.self]

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
//        if dataAllList.count <= indexPath.row {
//            return 0
//        }
//        return 114
        
        let mClass = cellTypes[indexPath.section]

        return mClass.getHeightWithItem(getCellItem(indexPath), indexPath: indexPath, tableView: self.tableview, isInternalCell: false, handle: self.tableview.handler())
        
        
    }
    
    
    // 根据indexPath获取指定cell的item
    private func getCellItem(indexPath: NSIndexPath)->AnyObject {
        var item :AnyObject?
        item = dataAllList[indexPath.row]
        return item!
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell:QuestionListCell = tableView.dequeueReusableCellWithIdentifier(CellIdCell,forIndexPath: indexPath) as! QuestionListCell
        
        cell.fillData(getCellItem(indexPath), indexPath: indexPath, handle: tableView.handler())
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! COBaseCell
        cell.onClickCell(indexPath, item: getCellItem(indexPath),handle:tableView.handler())
        

        
    }
    
    @IBAction func checkEvaluate(button:UIButton){
        

    }
    

}
