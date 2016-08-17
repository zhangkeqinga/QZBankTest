//
//  UIButton.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/3/3.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

extension UIView{
    
//    
    func rotate90(){
        let at = CGAffineTransformMakeRotation(CGFloat(M_PI)/2)
        self.transform = at
    }
    
    func rotate360Degrees(duration: CFTimeInterval = 2, completionDelegate: AnyObject? = nil) {
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * 0.5)
        rotateAnimation.duration = duration
        
//        if let delegate: AnyObject = completionDelegate {
//            rotateAnimation.delegate = delegate
//        }
        
        self.layer.addAnimation(rotateAnimation, forKey: nil)
    }
    
    
}
