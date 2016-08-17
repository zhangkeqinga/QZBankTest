//
//  AppDelegate.swift
//  QZBankTest
//
//  Created by mac on 16/8/4.
//  Copyright © 2016年 com.cn.QZ. All rights reserved.
//


//友盟  57a41c6fe0f55a8455000549

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navgationVC:UINavigationController?
    
    var leftSwipeGestureRecognizer :UISwipeGestureRecognizer!
    var rightSwipeGestureRecognizer:UISwipeGestureRecognizer!

    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //起始设置
        self.applicationSetting()
//
//        self.testMysql()
        
        //沉睡3秒
//        NSThread.sleepForTimeInterval(0.2)
        
//        let welcomeVC = RootVC()
        
        if !CODateTool.compareDateBool() {
            return true
        }
        
        let welcomeVC = MainTabBarVC()
//        welcomeVC.isWithXib = true
        navgationVC = UINavigationController(rootViewController: welcomeVC)
        navgationVC?.navigationBar.hidden = false
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = navgationVC
        window?.makeKeyAndVisible()
        
        
        
        return true
    }
    
    
    func applicationSetting(){
        
        //本地数据库拷贝
        COFileTool.copyDatabaseIfNeededWithFileName(JIAFENG_DB, searchPathDirectory: NSSearchPathDirectory.DocumentDirectory)
        
        //数据库预置
        DBSwiftHandle.registerTables()
        
        //键盘
        self.initKeyboard()
        
        //添加手势
        self.addGuster()
        
        //友盟添加
        self.initMobClick()
        
        
        
        
    }
    
    
    //MARK:applicationWillResignActive
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    var UMAppkey1:String = "57a493a9e0f55acd17000024" //
    
    //MARK:--initMobClick
    func initMobClick(){
        
        MobClick.setLogEnabled(true)
        let obj = UMAnalyticsConfig.init()
        obj.appKey = UMAppkey1
        MobClick.startWithConfigure(obj)
        

    }

    
    
    //MARK:--initKeyboard
    func initKeyboard(){  //键盘事件
        let keyManager = IQKeyboardManager.sharedManager()
        keyManager.enableAutoToolbar = false
        keyManager.shouldResignOnTouchOutside = true
        keyManager.overrideKeyboardAppearance = false
    }

    
    
    //MARK:--添加手势
    func addGuster()
    {
        leftSwipeGestureRecognizer = UISwipeGestureRecognizer()
        leftSwipeGestureRecognizer.addTarget(self, action: #selector(AppDelegate.handleSwipes(_:)))
        leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Left
        rightSwipeGestureRecognizer = UISwipeGestureRecognizer()
        rightSwipeGestureRecognizer.addTarget(self, action: #selector(AppDelegate.handleSwipes(_:)))
        rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Left
        
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.window?.rootViewController?.view.addGestureRecognizer(leftSwipeGestureRecognizer)
        appDelegate.window?.rootViewController?.view.addGestureRecognizer(rightSwipeGestureRecognizer)
        
    }
    
    func handleSwipes(sender : UISwipeGestureRecognizer)
    {
        if (sender.direction == UISwipeGestureRecognizerDirection.Left) {
            log("你在往左边跑啊.");
            
        }
        
        if (sender.direction == UISwipeGestureRecognizerDirection.Right) {
            log("你在往右边跑啊.");
            
        }
    }
    
    var JIAFENG_DB = "TheQuestionBank.db"
//    var JIAFENG_DB = "JiaFeng.db"

    //MARK: TEST SQL 
    func testMysql(){
        
        let array = QuestionData().queryAllDirectorSingleQuestionData()
        print("array=\(array.count)")

        //test
//        let model:SqlModel =  JFDDBManager.sharedInstance().queryModel(1)
//        print("model=\(model.descriptions)")
        
        
        
    }
    


}

