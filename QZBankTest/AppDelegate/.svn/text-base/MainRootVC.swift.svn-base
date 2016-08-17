//
//  ViewController.swift
//  QZBankTest
//
//  Created by mac on 16/8/4.
//  Copyright © 2016年 com.cn.QZ. All rights reserved.
//

import UIKit

class MainRootVC: BaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "农业银行题库"
//        self.OnClickActionNextVC()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    @IBAction func OnClickActionNextVC(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let myPersonnelListVC = MainTabBarVC()
        appDelegate.navgationVC?.pushViewController(myPersonnelListVC, animated: true)
        appDelegate.navgationVC?.navigationBarHidden = true

    }


}

