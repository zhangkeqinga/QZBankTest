//
//  UITableView+handler.swift
//  COSFUICatalog
//
//  Created by carlosk on 14/12/28.
//  Copyright (c) 2014年 carlosk. All rights reserved.
//

import Foundation
import UIKit


private var co_className = "UITableView"

public extension UITableView{
	//填充数据,
    
    public func fillData(type:COBaseCell.Type,data:[AnyObject],isInternalCell:Bool=false){
		
        let handler = self.handler()
        handler.fillData(type, data: data, tableView: self,isInternalCell:isInternalCell)
	    
    }
	
	//data是数组的数组,说明有多个setion.
    public func fillDataWithSetions(type:COBaseCell.Type,data:[AnyObject],setionData:[AnyObject],isInternalCell:Bool=false){
		
        let handler = self.handler()
        handler.fillDataWithSetions(type, data: data, setionData: setionData, tableView: self, isInternalCell: isInternalCell)
	    
    }
    
	public func setHandler(tableViewHandler:TableViewHandler){
				objc_setAssociatedObject(self, &co_className, tableViewHandler, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
	
    }
    
	public func handler()->TableViewHandler{
		var handerl = objc_getAssociatedObject(self, &co_className) as? TableViewHandler
		if handerl == nil{
			handerl = TableViewHandler()
			setHandler(handerl!)
		}
		return handerl!
	}
	public func reloadData(data:[AnyObject]){
		handler().data = data
		reloadData()
	}
	public func reloadData(data:[AnyObject],setionData:[AnyObject]){
		handler().data = data
		handler().setionData = setionData
		reloadData()
	}
    public func reloadDatas(data:[AnyObject],setObject :[AnyObject]){
        handler().data = data
        handler().object = setObject
        reloadData()
    }
    
	//清空目前的底部View
	public func clearFootV(){
		tableFooterView = UIView()
	}
	//滚动到底部
	public func scrollToBottom(){
		let section = numberOfSections - 1
		if section < 0 {
			return
		}
		let row = numberOfRowsInSection(section) - 1
		if row < 0 {
			return
		}
		let ip = NSIndexPath(forRow: row, inSection:section)
		log("ip=\(ip)")
		scrollToRowAtIndexPath(ip, atScrollPosition: UITableViewScrollPosition.None, animated: true)
	}
}


//MARK: - TableViewHandler
public class TableViewHandler :NSObject,UITableViewDelegate,UITableViewDataSource{
	
    public var data :[AnyObject] = []
	public var setionData :[AnyObject]?//setion的数据
	public var classType:COBaseCell.Type!

	public var tableView:UITableView!
	public var onClickIndex:((NSIndexPath,AnyObject,TableViewHandler) -> Void)?
	public var isInternalCell = false
	public var object:AnyObject?//任何携带的数据
    
    public var deleteBtnClickedBlock: ((NSIndexPath,AnyObject, Bool) -> Void)? //  点击了删除按钮的block
    private var isCanEdit = false  //数据是否可以删除
    var deleteTitle = "删除"
    
    public func setDeleteBtnClicked(block:(NSIndexPath,AnyObject, Bool) -> Void) {
    
        isCanEdit = true  //如果实现了该block，则cell就是可以删除的
        deleteBtnClickedBlock = block
 
    }
	
    public func setCellOnclick(block:(NSIndexPath,AnyObject,TableViewHandler) -> Void){
		onClickIndex = block
	}
 
    public func fillDataWithSetions(type:COBaseCell.Type,data:[AnyObject],setionData:[AnyObject],tableView:UITableView,isInternalCell:Bool=false){
		self.setionData = setionData.count > 0 ? setionData:nil
        fillData(type, data: data, tableView: tableView, isInternalCell: isInternalCell)
	}
 
    public func fillData(type:COBaseCell.Type,data:[AnyObject],tableView:UITableView,isInternalCell:Bool=false){
		self.classType = type
		self.data = data
		self.isInternalCell = isInternalCell
		if !isInternalCell{
			type.registerCellNib(tableView)
		}
		self.tableView = tableView;
		//如果不设置的话,即使只有一个setion,也会显示setion Header
		let height = setionData?.count > 0 ? CV.BaseTableSetionHeadHight:0
		tableView.sectionHeaderHeight = height
		tableView.delegate = self
		tableView.dataSource = self
		self.tableView.reloadData()
	}
  
	
	public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		if let setionData1 = setionData {
			let count = setionData1.count
			return count
		}else{
			return 1
		}
	}
	
	
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if setionData?.count > 0 && data.count > section{
            
            let array: [AnyObject] = data[section] as! [AnyObject]
            let count = array.count
            return count
        }
        return data.count
    }
	
	public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let className = CU.getClassName(classType)!
		
        let cell = tableView.dequeueReusableCellWithIdentifier(className, forIndexPath: indexPath) as! COBaseCell
		
        var item1: AnyObject
		
        if setionData?.count > 0{
			let array: [AnyObject] = data[indexPath.section] as! [AnyObject]
			item1 = array[indexPath.row]
		
        }else{
			item1 = data[indexPath.row]
		
        }
		
        cell.fillData(item1, indexPath: indexPath,handle:self)
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
	}
    
    
	public func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		
        var item1: AnyObject
		if setionData?.count > 0{
			let array: [AnyObject] = data[indexPath.section] as! [AnyObject]
			item1 = array[indexPath.row]
		}else{
			item1 = data[indexPath.row]
		}
		return classType.getHeightWithItem(item1, indexPath: indexPath,tableView:tableView,isInternalCell:isInternalCell ,handle:self)
        
	}
    
    
	public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		var item1: AnyObject
		
        if setionData?.count > 0{
			let array: [AnyObject] = data[indexPath.section] as! [AnyObject]
			item1 = array[indexPath.row]
		}else{
			item1 = data[indexPath.row]
		}
        
		return classType.getHeightWithItem(item1, indexPath: indexPath,tableView:tableView,isInternalCell:isInternalCell ,handle:self)
	}
	
	public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: false)
		var item1: AnyObject
		if setionData?.count > 0{
			let array: [AnyObject] = data[indexPath.section] as! [AnyObject]
			item1 = array[indexPath.row]
		}else{
			item1 = data[indexPath.row]
		}

		let cell = tableView.cellForRowAtIndexPath(indexPath) as! COBaseCell
		if !cell.onClickCell(indexPath, item: item1,handle:self){
			onClickIndex?(indexPath,item1,self)
		}
	}
	public func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		if let setionData1 = setionData {
			let setionItem:AnyObject = setionData1[section]
			return classType.getSetionHeadV(setionItem, setion: section ,handle:self)
		}else{
			return nil
		}
	}
	public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if let setionData1 = setionData {
			let setionItem:AnyObject = setionData1[section]
			return classType.getSetionHeadTitle(setionItem, setion: section ,handle:self)
		}else{
			return nil
		}
	}
	public func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		if let setionData1 = setionData {
			let setionItem:AnyObject = setionData1[section]
			return classType.getSetionHeadHeight(setionItem, setion: section ,handle:self)
		}else{
			return 0
		}
	}
	public func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		if let setionData1 = setionData {
			let setionItem:AnyObject = setionData1[section]
			return classType.getSetionFootHeight(setionItem, setion: section ,handle:self)
		}else{
			return 0
		}
	}
	public func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		if let setionData1 = setionData {
			let setionItem:AnyObject = setionData1[section]
			return classType.getSetionFootV(setionItem, setion: section ,handle:self)
		}else{
			return nil
		}

	}
  
  // 是否可以删除
  public func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return isCanEdit
  }
  
  // 删除
  public func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
  
    if (editingStyle == UITableViewCellEditingStyle.Delete) {
      if let block = deleteBtnClickedBlock {
				var item1: AnyObject
				if setionData?.count > 0{
					let array: [AnyObject] = data[indexPath.section] as! [AnyObject]
					item1 = array[indexPath.row]
				}else{
					item1 = data[indexPath.row]
				}
        block(indexPath,item1,(setionData?.count > 0))
      }
    }
  }
  
  public func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
    return deleteTitle
  }
    
    
    
	/*
	// Override to support conditional editing of the table view.
	override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
	// Return NO if you do not want the specified item to be editable.
	return true
	}
	*/
	
	/*
	// Override to support editing the table view.
	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
	if editingStyle == .Delete {
	// Delete the row from the data source
	tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
	} else if editingStyle == .Insert {
	// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
	}
	}
	*/
	
	/*
	// Override to support rearranging the table view.
	override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
	
	}
	*/
	
	/*
	// Override to support conditional rearranging of the table view.
	override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
	// Return NO if you do not want the item to be re-orderable.
	return true
	}
	*/
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	// Get the new view controller using [segue destinationViewController].
	// Pass the selected object to the new view controller.
	}
	*/
	
}
