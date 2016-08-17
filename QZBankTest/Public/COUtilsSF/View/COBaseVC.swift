//
//  BaseVC.swift
//  COSFUICatalog
//
//  Created by carlosk on 14/12/28.
//  Copyright (c) 2014年 carlosk. All rights reserved.
//  主体框架

import UIKit
var currentVC:COBaseVC? = nil

public class COBaseVC: UIViewController,UIAlertViewDelegate,UIActionSheetDelegate {
	
    var isLoadding = false//是否加载..这个值给子类调用,方便做异步处理
	var isWithXib = false //是否加载xib数据
	var isGetMeCurrentVC = true//是否给我当前VC的赋值
	var onNavRightBtnBlock:(()->Void)?//点击了右边的按钮
    
//    var atpersonBlock:((comment:CommentM)-> CommentM)?
//    
//    var serviceUserM:ServiceUserM?

	//更新了以后
	public override func updateViewConstraints() {
		super.updateViewConstraints()
	}
    
	public override func viewDidLoad() {
		super.viewDidLoad()
        
		if isGetMeCurrentVC {
			currentVC = self
		}
        
		if isWithXib {
			loadXib()
		}
        
		createViews()    //MVC
		createData()
		createEvets()
	}
	
	func loadXib(){
        
		let nibName = CU.getClassName(self.classForCoder)!
        if (nibName != "") {
            NSBundle.mainBundle().loadNibNamed(nibName, owner:self, options:nil)

        }
	}
	
	public override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		if isGetMeCurrentVC {
			currentVC = self
		}
		fillViewsOnResume()
		fillDataOnResume()
	}
	//设置导航栏右边的按钮
	func setNavRightBtn(title:String?,imageName:String?,block:(()->Void)? = nil)->UIBarButtonItem{
		var btnItem : UIBarButtonItem?
		let onRightNavBtnSelectorName = "onClickRightNavBtn"
		onNavRightBtnBlock = block
		
        if let _ = title{
			btnItem = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.Bordered, target: self, action: Selector(onRightNavBtnSelectorName))
			btnItem!.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFontOfSize(13)], forState: UIControlState.Normal)
		}else if let imageName_ = imageName{
			btnItem = UIBarButtonItem(image: UIImage(named: imageName_), style: .Bordered, target: self, action: Selector(onRightNavBtnSelectorName))
		}
		navigationItem.rightBarButtonItem = btnItem
		return btnItem!
	}
	
	//创建导航栏上的按钮
	func createNavItemBtn(title:String?,imageName:String?,selectorName:String,font:UIFont = UIFont.systemFontOfSize(13))->UIBarButtonItem {
		var btnItem : UIBarButtonItem?
		if let _ = title{
			btnItem = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.Bordered, target: self, action: Selector(selectorName))
			btnItem!.setTitleTextAttributes([NSFontAttributeName:font], forState: UIControlState.Normal)
		}else if let imageName_ = imageName {
			btnItem = UIBarButtonItem(image: UIImage(named: imageName_), style: .Bordered, target: self, action: Selector(selectorName))
		}
		return btnItem!
	}
    
	//点击了右边的按钮
	func onClickRightNavBtn(){
	 if let block = onNavRightBtnBlock {
		block()
		}
	}
	
	deinit{
		CU.notifyRemove(self)
	}
    
	// MARK:子类继承
	//创建的时候绘制View的地方
	public func createViews(){
		
	}
	//创建的时候写数据的地方
	public func createData(){
		
	}
	//创建的时候写事件的地方
	public func createEvets(){
		
	}
	//每次进入界面的时候会被调用
	public func fillViewsOnResume(){
		
	}
	//每次进入界面的时候会被调用
	public func fillDataOnResume(){
		
	}
    
    //其他事件
    public func otherOnClick(){
        
    }
    
    
	// MARK:弹出框
	//弹出
	var alertHandler: (() -> Void)? = nil
	var alert2Handler: (() -> Void)? = nil
	var alert3Handler: ((String) -> Void)? = nil//输入框
    
	public func alert(msg:String,handler: (() -> Void)? = nil)->UIAlertView{
		return alert(msg, confrimBtnTitle: "确定", handler: handler)
	}
    
	//自定义确认按钮
	public func alert(msg:String,confrimBtnTitle:String,handler: (() -> Void)? = nil)->UIAlertView{
		let title = COAppTool.appName()
		let otherBtn = confrimBtnTitle
		alertHandler = handler
		alert2Handler = nil
		alert3Handler = nil
		let alerV = UIAlertView(title: title, message: msg, delegate: handler != nil ? self : nil, cancelButtonTitle: nil, otherButtonTitles: otherBtn)
		alerV.show()
		return alerV
	}
    
	//工具类
	public class func alert(msg:String){
		let title = COAppTool.appName()
		let otherBtn = "确定"
		let alerV = UIAlertView(title: title, message: msg, delegate: nil, cancelButtonTitle: nil, otherButtonTitles: otherBtn)
		alerV.show()
	}
	
	//MARK: UIViewAlertDelegate
	public func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int){
		
        if alertView.alertViewStyle == .PlainTextInput {
			alertView.textFieldAtIndex(0)?.resignFirstResponder()
		}
		if buttonIndex == 0 && alertHandler == nil {
			return
		}
		if let handler_ = alertHandler {
			handler_()
		}else if let hander2_ = alert2Handler {
				
            hander2_()
		}else if let hander3_ = alert3Handler {
			
            hander3_(alertView.textFieldAtIndex(0)?.text ?? "")
		}
	}
	
	public func alert2(msg:String,handler: (() -> Void)? = nil)->UIAlertView{
		let title = COAppTool.appName()
		let cancelButton = "取消"
		let otherBtn = "确定"
		alert2Handler = handler
		alertHandler = nil
		alert3Handler = nil
		let alerV = UIAlertView(title: title, message: msg, delegate: handler != nil ? self : nil, cancelButtonTitle: cancelButton, otherButtonTitles: otherBtn)
		alerV.show()
		return alerV
	}
    
    public func alert22(msg:String,handler: (() -> Void)? = nil)->UIAlertView{
        let title = COAppTool.appName()
        let cancelButton = "取消"
        let otherBtn = "下一题"
        alert2Handler = handler
        alertHandler = nil
        alert3Handler = nil
        let alerV = UIAlertView(title: title, message: msg, delegate: handler != nil ? self : nil, cancelButtonTitle: cancelButton, otherButtonTitles: otherBtn)
        alerV.show()
        return alerV
    }
	
	//弹出输入框
	public func alertEdit2(msg:String,keyboardType:UIKeyboardType = .Default,handler: ((String) -> Void),alertTitle:String? = nil)->UIAlertView{
		
        let title = alertTitle == nil ? COAppTool.appName() : alertTitle!
		let cancelButton = "取消"
		let otherBtn = "确定"
		alert2Handler = nil
		alertHandler = nil
		alert3Handler = handler
        
		let alerV = UIAlertView(title: title, message: msg, delegate: self, cancelButtonTitle: cancelButton, otherButtonTitles: otherBtn)
		alerV.alertViewStyle = .PlainTextInput
		alerV.textFieldAtIndex(0)!.keyboardType = keyboardType
//        alerV.textFieldAtIndex(0)?.borderStyle = .RoundedRect

		//		alerV.endEditing(true)
		alerV.show()
		return  alerV
	}
	
	//显示sheet根据右边导航栏的按钮
	private var sheetBlock:((Int)->Void)?
	
	public func sheet(block:((Int)->Void),title:String? = COAppTool.appName(),otherTitles:[String]){
		sheetBlock = block
		let sheet = UIActionSheet(title: title, delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil)
		for eachOther in otherTitles {
			sheet.addButtonWithTitle(eachOther)
		}
		sheet.actionSheetStyle = .BlackOpaque
		let v:UIView
		if self.navigationController?.view != nil {
			v = self.navigationController!.view
		}else{
			v = self.view
		}
		sheet.showInView(v)
	}
	public func sheet(block:((Int)->Void),title:String? = COAppTool.appName(),otherTitles:String...){
		sheet(block, title: title, otherTitles: otherTitles)
	}
	
	//0是确定,1是取消,接下来是other
	public func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int){
		if let block = sheetBlock {
			block(buttonIndex)
		}
	}
	
	// MARK:界面流转
	//推送到下一个
	public func pushVC(vc:COBaseVC,anim:Bool = true){
		navigationController!.pushViewController(vc, animated: anim)
	}
	
	public func pushXibVC(vc:COBaseVC,anim:Bool){
		vc.isWithXib = true
		navigationController!.pushViewController(vc, animated: anim)
	}
    
	public func pushXibVC(vc:COBaseVC){
		vc.isWithXib = true
		navigationController!.pushViewController(vc, animated: true)
	}
	
	public class func removeVCWithNav(vc:UIViewController){
		let mVC = vc
		var vcs = vc.navigationController!.viewControllers
		for (index,eachVC) in vcs.enumerate() {
			if eachVC == mVC {
				vcs.removeAtIndex(index)
				break
			}
		}
		vc.navigationController!.viewControllers = vcs
	}
    
	//返回到上一个
	public func pop(num:Int,anim:Bool = true){
		if num == 1 {
			navigationController!.popViewControllerAnimated(anim)
			return
		}
		//如果是多个
		let count = navigationController!.viewControllers.count
		if count < num + 1 {
			return
		}
		let goToVC:UIViewController = navigationController!.viewControllers[count - num - 1]
		navigationController!.popToViewController(goToVC, animated: true)

	}
    
	public func pop(){
		pop(1)
	}
    
	public var identifierAndFillValue:[String:((COBaseVC) -> Void)?] = [:]
	
    //推送到下面的界面
	public func pushVCWithIF(indentifier:String,block:((COBaseVC) -> Void)? = nil){
		identifierAndFillValue[indentifier] = block
		self.performSegueWithIdentifier(indentifier, sender: self)
	}
	
	//	pushVCWithRelationIF
	//跳转到没有关联的VC上,但还是该storyboard
	public func pushVCWithRelationIF(indentifier:String,block:((COBaseVC) -> Void)? = nil){
		pushVCWithRelationIF(indentifier, block: block, anim: true)
	}
	
	public func pushVCWithRelationIF(indentifier:String,block:((COBaseVC) -> Void)? = nil,anim:Bool){
		identifierAndFillValue[indentifier] = block
		let vc = currentVC!.storyboard!.instantiateViewControllerWithIdentifier(indentifier) as! COBaseVC
		if let block1 = block {
			block1(vc)
		}
		currentVC!.pushVC(vc, anim: anim)
	}
	
	
	public func pushVCWithRelationIF(classType classType:AnyClass,block:((COBaseVC) -> Void)? = nil){
		pushVCWithRelationIF(CU.getClassName(classType)!, block: block)
	}
	
	public func pushVCWithIF(classType classType:AnyClass,block:((COBaseVC) -> Void)? = nil){
		let className = CU.getClassName(classType)!
		pushVCWithIF(className, block: block)
	}
	
	public func pushVCWithXib(vc:COBaseVC,block:((COBaseVC) -> Void)? = nil){
		if let block2 = block{
			block2(vc)
		}
		vc.isWithXib = true
		pushVC(vc, anim: true)
	}
	
	public override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		let targetVC = segue.destinationViewController 
		if !(targetVC is COBaseVC) || String.isEmpty(segue.identifier){
			return
		}
		if let block1 = identifierAndFillValue[segue.identifier!] {
			if let block2 = block1{
				block2((targetVC as! COBaseVC))
			}
		}
	}
	
	//检查线程对象,如果有错误码则显示
	public func checkThreadMsg(threadMsg:COThreadM) -> Bool{
		if threadMsg.receiveIsSuccess {
			return true
		}

		alert(threadMsg.receiveErrorMsg)
		return false
	}
	
	//	#pragma mark 风火轮
	// MARK: 风火轮
	public func showProgressV(){
	}
	public func hideProgressV(){
 	}
	
}
