//
//  RootCell.swift
//  QZBankTest
//
//  Created by mac on 16/8/7.
//  Copyright © 2016年 com.cn.QZ. All rights reserved.
//

import UIKit

class RootCell: BaseCell {
    
    @IBOutlet weak var titleLb: UILabel!
    
    @IBOutlet weak var singleTypeLb: UILabel!
    @IBOutlet weak var moreTypeLb  : UILabel!
    @IBOutlet weak var judgeTypeLb : UILabel!
    
    @IBOutlet weak var singleNumberLb: UILabel!
    @IBOutlet weak var moreNumberLb  : UILabel!
    @IBOutlet weak var judgeNumberLb : UILabel!
    
    @IBOutlet weak var singlePercentLb: UILabel!
    @IBOutlet weak var morePercentLb  : UILabel!
    @IBOutlet weak var judgePercentLb : UILabel!
    
    @IBOutlet weak var singleBtn: UIButton!
    @IBOutlet weak var moreBtn  : UIButton!
    @IBOutlet weak var judgeBtn : UIButton!
    
    @IBOutlet weak var erroeBtn: UIButton!
    @IBOutlet weak var collectionBtn: UIButton!
    
    @IBOutlet weak var singleView: UIView!
    @IBOutlet weak var moreView  : UIView!
    @IBOutlet weak var judgeView : UIView!
    
    @IBOutlet weak var singleViewV: UIView!
    @IBOutlet weak var moreViewV  : UIView!
    @IBOutlet weak var judgeViewV : UIView!
    
    var userQuestionM:UserQuestionM!
    
    override func createViews() {
        super.createViews()

    }
    
    override func fillData(item:AnyObject,indexPath : NSIndexPath,handle:TableViewHandler){
        super.fillData(item, indexPath: indexPath, handle: handle)
        let iteam = item as! UserQuestionM
        userQuestionM =  item as! UserQuestionM
        
        var typeName = ""
        if iteam.userType == 1{
            typeName = "主管"
        }
        if iteam.userType == 2{
            typeName = "柜员"
        }

        /**
         主管题库（顺序练习）
         单选题(主管)
         多选题(主管)
         判断题(主管)
         ()
         ()
         ()
         
         错误()
         收藏()
         
         */
        titleLb.text = typeName + "题库（顺序练习）"
        singleTypeLb.text = "单选题(" + typeName + ")"
        moreTypeLb.text = "多选题(" + typeName + ")"
        judgeTypeLb.text = "判断题(" + typeName + ")"
        
        singleNumberLb.text = String(iteam.singleFishNumber) + "/" + String(iteam.singleNumber)
        moreNumberLb.text =  String(iteam.moreFishNumber) + "/" + String(iteam.moreNumber)
        judgeNumberLb.text = String(iteam.judgeFishNumber) + "/" +  String(iteam.judgeNumber)
        
        singlePercentLb.text =  String(100*iteam.singleFishNumber/iteam.singleNumber) + "%"
        morePercentLb.text =  String(100*iteam.moreFishNumber/iteam.moreNumber) + "%"
        judgePercentLb.text =  String(100*iteam.judgeFishNumber/iteam.judgeNumber) + "%"
        
        erroeBtn.setTitle("错误(" + String(iteam.errorNumber) + ")")
        collectionBtn.setTitle("收藏(" + String(iteam.collectNumber) + ")")
        
        let singleVwidth = singleView.frame.size.width
        let moreVwidth = moreView.frame.size.width
        let judeVwidth = judgeView.frame.size.width
        
        let singleVwidth2 = singleVwidth*CGFloat(iteam.singleFishNumber)/CGFloat(iteam.singleNumber)
        let moreVwidth2 = moreVwidth*CGFloat(iteam.moreFishNumber)/CGFloat(iteam.moreNumber)
        let judeVwidth2 = judeVwidth*CGFloat(iteam.judgeFishNumber)/CGFloat(iteam.judgeNumber)
        
        
        singleViewV.frame = CGRectMake(0, 0, singleVwidth2, singleView.frame.size.height)
        moreViewV  .frame = CGRectMake(0, 0, moreVwidth2, moreView.frame.size.height)
        judgeViewV .frame = CGRectMake(0, 0, judeVwidth2, judgeView.frame.size.height)
        
        
    }
    
    override func onClickCell(index: NSIndexPath, item: AnyObject,handle:TableViewHandler) -> Bool {
        return true
    }
    
    
    @IBAction func onClickNextVC(sender:UIButton) {
        
        let vc = QuestionListVC()
        vc.isWithXib = true
        vc.userQuestionM = userQuestionM
        vc.btnTag = sender.tag - 1000
        currentVC?.pushVC(vc)
        
    }
    
    
}
