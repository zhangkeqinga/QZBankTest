//
//  BaseVC.swift
//  COXbry
//
//  Created by carlosk on 15/1/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit
//import CU

class BaseVC: BaseCommontVC {
	
	var onClickNavLeftBlock:(()->Void)?
    var onClickSelectIteamBlock:(()->Void)?
    
	var mLeftNavBtn:UIBarButtonItem?
	var mRightNavBtns:[UIBarButtonItem]?
    
    var searchsBtn:UIButton?
    var searchImgv:UIImageView?
    var seacrchTF:UITextField?

    var customLab:UILabel!
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.Default, animated: true)
        
        if self.navigationController != nil{
            self.navigationController!.navigationBarHidden = false
        }
        
        if (self.tabBarController != nil){
            self.tabBarController!.tabBar.hidden = true
            CU.notifyPost("tabBarFootViewHidenOrShow")
            
        }
        
        navigationController?.navigationBar.barTintColor = UIColor.navBlueBGColor()
        
        customLab = UILabel()
        customLab.frame = CGRectMake(60, 0, CV.BaseWidth-160, 30)
        customLab.textAlignment = NSTextAlignment.Center
        customLab.font = UIFont.boldSystemFontOfSize(18)
        self.navigationItem.titleView = customLab;
        customLab.text = self.title
        customLab.textColor = UIColor.whiteColor()
        
    }
    
    
	override func viewDidLoad() {
		//对使用autolayout设置toplayout的所有继承ScrollView的view都可能有这个bug
		setNavBarSetting()
		super.viewDidLoad()
		let bgColor = UIColor.vcColor()
		view.backgroundColor = bgColor
		automaticallyAdjustsScrollViewInsets = false
		COFontAndColorToTagHandle.setAllFontAndColorWithTag(self.view)
	    
    }
    
    override func viewWillDisappear(animated: Bool) {
        removeViewFromNavigation()
        super.viewWillDisappear(animated)

    }
    
    
	func setBgImage(){
        
		let bgImage = Config.IsPublicServer ? "bg_china" : "koala_bg"
		let imageV = UIImageView(image: UIImage(named:  bgImage))
		imageV.frame = CGRectMake(0, CV.BaseNavStatusHeight, CV.BaseWidth, CV.BaseHeightNoStatusNoNav)
		view.insertSubview(imageV, atIndex: 0)
	}
	
	
	func createRightNavBtnWithBgColor(title:String,funcName:Selector){
		let rightBtn = UIButton(frame: CGRectMake(0, 7, 60, 30))
		rightBtn.setTitle(title)
		rightBtn.backgroundColor = UIColor.navBGColor()
		rightBtn.addTarget(self, action:funcName, forControlEvents: UIControlEvents.TouchUpInside)
		
		let rightItem = UIBarButtonItem(customView: rightBtn)
		self.mRightNavBtns = [rightItem]
		navigationItem.rightBarButtonItems = self.mRightNavBtns
	}
	
    
    func createRightNavBtn(imageNames:[String],funcName:Selector,sizeWidth:CGFloat = 35){
		let rightBtn = UIButton(frame: CGRectMake(0, 0, sizeWidth, sizeWidth))
		rightBtn.setTitle("")
		rightBtn.backgroundColor = UIColor.clearColor()
		rightBtn.addTarget(self, action:funcName, forControlEvents: UIControlEvents.TouchUpInside)
		
		rightBtn.setBgImageName(imageNames[0], pressImageName: imageNames[1])
		
		let rightItem = UIBarButtonItem(customView: rightBtn)
		self.mRightNavBtns = [rightItem]
		navigationItem.rightBarButtonItems = self.mRightNavBtns
	}
    
    
    func createSearchNavBtn(sizeWidth:CGFloat = 35) ->UISearchBar {
        let searchBar = UISearchBar()
        searchBar.frame = CGRectMake(60, 7, CV.BaseWidth-80, 30)
        navigationController?.navigationBar.addSubview(searchBar)
        
        return searchBar
    }
    
    func removeViewFromNavigation(){
        
        if searchImgv != nil{
            searchImgv?.removeFromSuperview()
            searchImgv = nil
        }
        
        if searchsBtn != nil{
            searchsBtn?.removeFromSuperview()
            searchsBtn = nil
        }

        if seacrchTF != nil{
            seacrchTF?.removeFromSuperview()
            seacrchTF = nil
        }

        
    }
    
    
    //MARK:维保服务 搜索button
    func createSearchButtonNext(imageNames:String,funcName:Selector){
        
        let frame =  CGRectMake(40, ((navigationController?.navigationBar.frame.size.height)!-30)/2, CV.BaseWidth-50, 30)
        
        searchImgv = UIImageView()
        searchImgv!.frame = frame
        let edge = UIEdgeInsetsMake(13, 30, 13, 30)
        let img = UIImage(named: imageNames)?.resizableImageWithCapInsets(edge)
        searchImgv!.image = img
        navigationController?.navigationBar.addSubview(searchImgv!)

        searchsBtn = UIButton()
        searchsBtn?.frame = frame
        
        searchsBtn!.setTitle("输入网点名称    ")
        searchsBtn!.setTitleColor(UIColor.lowBlueColor(), forState: .Normal)
        searchsBtn!.titleLabel?.font = UIFont.systemFontOfSize(14)
        searchsBtn!.titleLabel?.textAlignment = NSTextAlignment.Left
        searchsBtn!.backgroundColor = UIColor.clearColor()
        searchsBtn!.addTarget(self, action:funcName, forControlEvents: UIControlEvents.TouchUpInside)
        navigationController?.navigationBar.addSubview(searchsBtn!)
        
    }
    
    //维保服务 搜索TextFiled
    func createSearchTextFiled(imageNames:String,funcName:Selector,placeholder:String) -> UITextField{
        
        
        let frame = CGRectMake(40, ((navigationController?.navigationBar.frame.size.height)!-27)/2, CV.BaseWidth-50 - 45, 27)
        

        searchImgv = UIImageView()
        searchImgv!.frame = frame
        let edge = UIEdgeInsetsMake(13, 30, 13, 30)
        let img = UIImage(named: imageNames)?.resizableImageWithCapInsets(edge)
        searchImgv!.image = img
        navigationController?.navigationBar.addSubview(searchImgv!)
        
        searchsBtn = UIButton(frame: CGRectMake( frame.origin.x + frame.size.width + 5, ((navigationController?.navigationBar.frame.size.height)!-27)/2, CV.BaseWidth - (frame.origin.x + frame.size.width + 5) - 5, 27))
        
        searchsBtn!.setTitle("搜索    ")
        searchsBtn!.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        searchsBtn!.titleLabel?.font = UIFont.systemFontOfSize(14)
        searchsBtn!.titleLabel?.textAlignment = NSTextAlignment.Center
        searchsBtn!.backgroundColor = UIColor.clearColor()
        searchsBtn!.addTarget(self, action:funcName, forControlEvents: UIControlEvents.TouchUpInside)
//        searchBtn.setBackgroundImage(UIImage(named:imageNames), forState: .Normal)
        navigationController?.navigationBar.addSubview(searchsBtn!)
        
        
//        if seacrchTF != nil{
//            seacrchTF?.removeFromSuperview()
//            seacrchTF = nil
//        }
        
        seacrchTF = UITextField()
        seacrchTF!.frame = CGRectMake(frame.origin.x + 30, frame.origin.y, frame.size.width-30, frame.size.height)
        seacrchTF!.placeholder = placeholder
        seacrchTF!.font = UIFont.systemFontOfSize(14)
        seacrchTF!.textColor = UIColor.lowBlueColor()
        navigationController?.navigationBar.addSubview(seacrchTF!)
        
        return seacrchTF!
    }
    
    
    
	//添加多个
	func createRightNavBtns(imageNamess:[[String]],funcNames:[Selector],sizeWidth:CGFloat = 35)->[UIButton]{
		
		var itemBtns :[UIBarButtonItem] = []
		var btns:[UIButton] = []
		for (index,imageNames) in imageNamess.enumerate() {
			let funcName = funcNames[index]
			let rightBtn = UIButton(frame: CGRectMake(0, 0, sizeWidth, sizeWidth))
			rightBtn.setTitle("")
			rightBtn.backgroundColor = UIColor.clearColor()
			rightBtn.addTarget(self, action:funcName, forControlEvents: UIControlEvents.TouchUpInside)
			
			rightBtn.setBgImageName(imageNames[0], pressImageName: imageNames[1])
			btns.append(rightBtn)
			let rightItem = UIBarButtonItem(customView: rightBtn)
			itemBtns.append(rightItem)
		}
        
		self.mRightNavBtns = itemBtns
		navigationItem.rightBarButtonItems = self.mRightNavBtns
		return btns
	}
	
    
	func createRightNavBtns(imageNamess:[[String]],funcNames:[Selector],sizeWidths:[CGFloat] )->[UIButton]{
		
		var itemBtns :[UIBarButtonItem] = []
		var btns:[UIButton] = []
		for (index,imageNames) in imageNamess.enumerate() {
			let funcName = funcNames[index]
			let rightBtn = UIButton(frame: CGRectMake(0, 0, sizeWidths[index], sizeWidths[index]))
			rightBtn.setTitle("")
			rightBtn.backgroundColor = UIColor.clearColor()
			rightBtn.addTarget(self, action:funcName, forControlEvents: UIControlEvents.TouchUpInside)
			
			rightBtn.setBgImageName(imageNames[0], pressImageName: imageNames[1])
			btns.append(rightBtn)
			let rightItem = UIBarButtonItem(customView: rightBtn)
			itemBtns.append(rightItem)
		}
		self.mRightNavBtns = itemBtns
		navigationItem.rightBarButtonItems = self.mRightNavBtns
		return btns
	}
    
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
	}
    
    
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		super.touchesBegan(touches, withEvent: event)
		view.endEditing(true)
	}
    
	//设置导航栏,只有第一次才需要用
	func setNavBarSetting(){
		if navigationController == nil {
			return
		}
        
		navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
		navigationController?.navigationBar.backgroundColor = UIColor.whiteColor()
		navigationController?.navigationBar.tintColor = UIColor.whiteColor()
		let dict = [NSForegroundColorAttributeName: UIColor.grayColor()]
		navigationController?.navigationBar.titleTextAttributes = dict
		navigationController?.navigationBar.translucent = true
		setLeftNavBtn("通用_arrow_normal",pressImageName:"通用_arrow_normal")
	}
    
	//设置左边的按钮
	func setLeftNavBtn(imageName:String,pressImageName:String,block:(()->Void)? = nil){
		let leftBtn = UIButton(frame: CGRectMake(0, 0, 45, 44))
		leftBtn.setImage(UIImage(named: imageName)!, pressImage: UIImage(named: pressImageName)!)
		leftBtn.setTitle("")
		leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 15)
		leftBtn.backgroundColor = UIColor.clearColor()
		leftBtn.addTarget(self, action: #selector(BaseVC.onClickNavLeftItem), forControlEvents: UIControlEvents.TouchUpInside)
		let backItem = UIBarButtonItem(customView: leftBtn)
		navigationItem.leftBarButtonItem = backItem
		mLeftNavBtn = backItem
		if navigationController?.viewControllers.count ?? 0 == 1 {
			navigationItem.leftBarButtonItem = nil
			mLeftNavBtn = nil
		}
        
		if let block1 = block {
			self.onClickNavLeftBlock = block1
		}
		//设置右边的按钮
		setNavRightBtn("", imageName: nil, block: nil)
        
//        leftBtn.backgroundColor = UIColor.blueColor()
        
	}
	
    
    //crash 崩溃的地方
	func onClickNavLeftItem(){
		if let block = onClickNavLeftBlock {
			block()
			return
		}
		self.pop()
	}
	
	//	#pragma mark 风火轮
//    var progress:MBProgressHUD?
//
//	// MARK: 风火轮
//	override func showProgressV(){
//		progress = MBProgressHUD.showHUDAddedTo(view, animated: true)
//		progress!.hide(true, afterDelay: 10)
//	}
//	func showProgressV(afterDelay:NSTimeInterval){
//		progress = MBProgressHUD.showHUDAddedTo(view, animated: true)
//		progress!.hide(true, afterDelay: afterDelay)
//	}
//    
//	override func hideProgressV(){
//        
// //		MBProgressHUD.hideAllHUDsForView(view, animated: true)
//		if progress != nil {
//            progress!.hide(true)
//		}
//	}
    
//	override func checkThreadMsg(threadMsg:COThreadM) -> Bool{  // ---
//		if threadMsg.receiveIsSuccess {
//			return true
//		}
//		showToast(threadMsg.receiveErrorMsg)
//        
//		return false
//	}
//	var toast:MBProgressHUD?
//	//显示土司
//	func showToast(msg:String,block:(()->Void)? = nil){
//		let toast  = MBProgressHUD.showHUDAddedTo(view, animated: true)
//		toast.mode = .Text
//		toast.labelText = msg
//		toast.hide(true, afterDelay: 2)
//		if block != nil {
//			CU.delay(2, task: { () -> () in
//				block?()
//			})
//		}
//	}
}
