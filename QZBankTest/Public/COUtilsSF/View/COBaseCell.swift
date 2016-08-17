//
//  COBaseCell.swift
//  COSFUICatalog
//
//  Created by carlosk on 14/12/28.
//  Copyright (c) 2014年 carlosk. All rights reserved.
//

import UIKit

private var cellDict=[String:COBaseCell?]()

public class COBaseCell: UITableViewCell {
	
    private var isFrist = true
	public override func setNeedsLayout() {
		super.setNeedsLayout()
	}
	private func tryFrist(){
        
		if isFrist {
			isFrist = false
			createViews()
		}
	}
    
	//单例获取本对象
	 private class func getMyCell(tableView:UITableView,isInternalCell:Bool=false) ->COBaseCell!
     {
        
		let className = CU.getClassName(self)!
		var mCell = cellDict[className]
		if let mCell1 = mCell {
			return mCell1
		}
        
		if isInternalCell {
			mCell = tableView.dequeueReusableCellWithIdentifier(className) as! COBaseCell!
		}else {
			mCell = COBaseV.create(className) as! COBaseCell!
		}
        
		cellDict[className] = mCell
		return mCell!
	}
	
  public override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
	//把本身注册在这个tableView上
	class func registerCellNib(mTableV:UITableView){
		let className = CU.getClassName(self)
		let nib = UINib( nibName: className! , bundle: nil)
		mTableV.registerNib(nib, forCellReuseIdentifier: className!)
	}
	
	// MARK: 需要被子类继承的
	//创建的时候被调用
	func createViews(){
		
	}
	// 每次填充数据被调用
	public func fillData(item:AnyObject,indexPath : NSIndexPath,handle:TableViewHandler){
		tryFrist()
	}
	
	//自动获取获取高度,如果要指定高度,则需要重写这个方法
	public class func getHeightWithItem(item:AnyObject,indexPath : NSIndexPath,tableView:UITableView,isInternalCell:Bool=false,handle:TableViewHandler)->CGFloat
	{
		let mCell = getMyCell(tableView,isInternalCell: isInternalCell)
	    
        mCell.fillData(item, indexPath: indexPath,handle:handle)
		
        let height = mCell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height;
        
		return height
	}
	
	// MARK: setion相关
	//获取setion的头部View,这里指的是自定义SetionHeadView..但还没有解决View重用的办法
	public class func getSetionHeadV(item:AnyObject,setion:Int ,handle:TableViewHandler)->UIView?{
		
		return nil
	}
	
	public class func getSetionFootHeight(item:AnyObject,setion:Int,handle:TableViewHandler)->CGFloat{
		
		return 0
	}
	
	public class func getSetionFootV(item:AnyObject,setion:Int ,handle:TableViewHandler)->UIView?{
		
		return nil
	}
	
	public class func getSetionHeadHeight(item:AnyObject,setion:Int,handle:TableViewHandler)->CGFloat{
		
		return CV.BaseTableSetionHeadHight
	}

	//获取setion的头部标题
	//如果用的是系统默认的setionTitle,则重载这个方法
	public class func getSetionHeadTitle(item:AnyObject,setion:Int , handle:TableViewHandler)->String?{
		
		return nil
	}
//	}
	//点击cell的事件,如果返回为false,则让tableView的onClickCellBlock处理
	public func onClickCell(index:NSIndexPath,item:AnyObject, handle:TableViewHandler)->Bool {
		return false
	}
	
	
}
