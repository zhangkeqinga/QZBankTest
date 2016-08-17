//
//  TechSupportTabBarVC.swift
//  TYKoalaServiceNice
//
//  Created by mac on 16/5/4.
//  Copyright © 2016年 com.cn.koalaservice.ty. All rights reserved.
//技服首页


import UIKit

class MainTabBarVC: UITabBarController,UIPopoverControllerDelegate  {

    let numberMenu:Int = 2
    
    var indexNum:NSInteger = 0
    var tabBarView:UIView!
    
    var selectedBtn:UIButton?
    var iteamArray:NSMutableArray?
    
    
    let imageArray =
        ["tab_我的维修",
         "tab_我的接单"]
//    ,
//    "tab_我的巡检",
//    "tab_我的服务"
    let imageArray1 =
        ["tab_我的维修2",
         "tab_我的接单2"
//            ,
//         "tab_我的巡检2",
//         "tab_我的服务2"
    ]
    

    
    //MARK: viewWillAppear
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBarHidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController!.navigationBarHidden = true
        self.tabBar.hidden = false
        super.viewWillDisappear(animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createNotification()
        loginSuccessFirst(0)
        
        let tabBarHight:CGFloat = 0
        self.tabBar.frame = CGRectMake(0, CV.BaseHeight-tabBarHight, CV.BaseWidth, 0)
        
        self.createTabBarView()
        selectFistPageVC()
        
    }
    
    
    func createNotification(){
        CU.notifyAdd(self, nofityName: "secondtabBarFootViewHiden", selectorName: "hidenFootView")
        CU.notifyAdd(self, nofityName: "secondtabBarFootViewShow", selectorName: "showFootView")
        CU.notifyAdd(self, nofityName: "BackFistPageVC", selectorName: "selectFistPageVC")
        CU.notifyAdd(self, nofityName: "gotoindexIteamVC", selectorName: "gotoindexIteamVC:")
    }
    

    //MARK: createTabBarView
    func createTabBarView(){
        
        let tabHeight = 50 as CGFloat
        
        tabBarView = UIView()
        tabBarView.frame = CGRectMake(0,CV.BaseHeight-tabHeight,CV.BaseWidth,tabHeight)
        tabBarView.backgroundColor = UIColor.whiteColor()
        
        let views = UIView()
        views.frame = CGRectMake(0, tabHeight - 40, CV.BaseWidth, 50)
        tabBarView.addSubview(views)
        views.backgroundColor = UIColor.whiteColor()
        
        for index in 1...self.numberMenu
        {
            let dis = CGFloat((CV.BaseWidth - CGFloat(40*self.numberMenu))/CGFloat(self.numberMenu))
            
            let btn = UIButton(frame: CGRectMake(CGFloat(index-1)*dis + dis/2 + CGFloat(index-1)*40  , 5 , 40, 40))
            
            btn.backgroundColor = UIColor.clearColor()
            btn.addTarget(self, action: #selector(MainTabBarVC.selectViewControllerNumber(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            btn.tag = 9999 + index
            btn.setImage(UIImage(named: imageArray[index-1]), forState: UIControlState.Normal)
            
//            if index == 3 {
//                btn.frame = CGRectMake(CV.BaseWidth/2-25 , 0,  50, 50)
//            }
            
            if index == 1 {  //默认选择左边第一个视图
                btn.setImage(UIImage(named: imageArray1[index-1]), forState: UIControlState.Normal)
            }
            
            tabBarView.addSubview(btn)
        }
        
        self.view .addSubview(tabBarView)
        
    }
    
    func gotoindexIteamVC(iteam:NSNotification){
        loginSuccessFirst(1)
    }
    
    func selectFistPageVC(){
        selectViewController(0)
    }
    
    func selectSecondPageVC(){
        selectViewController(1)
    }

    func hidenFootView(){
        if (tabBarView != nil) {
            tabBarView.hidden = true
        }
    }
    
    func showFootView(){
        if (tabBarView != nil) {
            tabBarView.hidden = false
        }
    }
    
    //选择第几个容器
    func selectViewController(indexnumber:NSInteger){
        self.selectedIndex=indexnumber;
        indexNum=indexnumber;
    }
    
    //选择第几个容器
    @IBAction func selectViewControllerNumber(sender: UIButton){
        
        self.selectedIndex = sender.tag-10000;
        indexNum = sender.tag-10000;
        
        for index   in 1...self.numberMenu
        {
            let btn = self.view.viewWithTag(index+9999) as! UIButton
            btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            
            if (index-1 == indexNum){
                btn.setImage(UIImage(named: imageArray1[index-1]), forState: UIControlState.Normal)
            }else{
                btn.setImage(UIImage(named: imageArray[index-1]), forState: UIControlState.Normal)
            }
        }
        
        sender.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        
        
    }
    

    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        self.selectedIndex=indexNum

    }
    
    
    func loginSuccessFirst(indexNum:NSInteger){
        loginSuccess(true)  //登陆
        
    }
    
    /**
     * 添加子控制器
     */
    
    func addChildViewControllerWithTitle(title: NSString,controller:AnyObject,icon:NSString,selIcon:NSString)
    {
        
        let vc:UIViewController = controller as! UIViewController
        let nav = UINavigationController()
        
        nav.pushViewController(vc, animated: false)
        nav.tabBarItem = UITabBarItem(title: title as String, image: UIImage(named: icon as String) , selectedImage: UIImage(named:selIcon as String))
        
        self.addChildViewController(nav)
        
    }
    
    func loginSuccess(isLogin:Bool){
        
        // 添加子控制器-首页
        let vc1  = RootVC()
        vc1.isWithXib = true
        self.addChildViewControllerWithTitle(NSLocalizedString("tech_menu_1", comment:""), controller: vc1 , icon: imageArray[0], selIcon: "product_gray")
        
        let vc2  = Menu1VC()
        vc2.isWithXib = true
        self.addChildViewControllerWithTitle(NSLocalizedString("tech_menu_2", comment:""), controller: vc2 , icon: imageArray[1], selIcon: "product_gray")

//        let vc3  = Menu3VC()
//        vc3.isWithXib = true
//        self.addChildViewControllerWithTitle(NSLocalizedString("tech_menu_3", comment:""), controller: vc3 , icon: imageArray[2], selIcon: "product_gray")
//        
//        let vc4  = Menu4VC()
//        vc3.isWithXib = true
//        self.addChildViewControllerWithTitle(NSLocalizedString("tech_menu_4", comment:""), controller: vc4 , icon: imageArray[3], selIcon: "product_gray")


    }
    
    
}

    
    

