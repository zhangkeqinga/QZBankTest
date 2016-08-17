//
//  HttpService.swift
//  COXbry
//
//  Created by carlosk on 15/1/5.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit
public class COHttpService: COBaseModel {
	//发送一个请求
	public class func post(threadModel:COThreadM,receiveUIBlock:((threadMsg:COThreadM)->Void)?){
		
        if threadModel.autoShowProgressV {
			currentVC?.showProgressV()
		}
        
		if let _ = receiveUIBlock {
			threadModel.receiveUIBlock = receiveUIBlock
		}
		
        //获取队列
        let aQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
        //将事件添加到队列
        dispatch_async(aQueue) { () -> Void in
			
            let types = CONet.getCOHttpOperationTypes()  //模块数组获取
			//循环处理
			for item in types {
				if item.operation(threadModel) {
					break
				}
			}
            
			//发送请求
			//把content和error制作返回的是否正确
			var content : String?
			var error   : NSError?
			var responseStatusCode : Int = 200
            
			if let coHttpConnectType_ = CONet.getCOHttpConnectType() {
				(content,error,responseStatusCode) = coHttpConnectType_.connect(threadModel)
			}else if let connectBlock = CONet.getCOHttpConnectBlock() {
				(content,error,responseStatusCode) = connectBlock(threadModel)
			}
			//拼装成返回是否正确的数据
			//如果有异常统一处理
            
			var isContinue = true
			if let operationBlock = CONet.getCOHttpFillThreadMWithReturnContentBlock(){
				isContinue =  operationBlock(content,error,threadModel,responseStatusCode)
			}
			
            //处理返回
			if isContinue && threadModel.receiveContent != nil  && threadModel.receiveToBackgourdBlock != nil{
				threadModel.receiveToBackgourdBlock!(threadMsg: threadModel)
			}
            
			let mainQueue = dispatch_get_main_queue();
			//处理回调
			dispatch_async(mainQueue, {() -> Void in
			
                if threadModel.autoHideProgressVWithFinishedRequest {
					currentVC?.hideProgressV()

				}
				if(isContinue){
					threadModel.receiveUIBlock?(threadMsg: threadModel)
				}
			})
		}
		
	}
    
    
    
//    //发送一个请求下载图片
//     class func postDownload(alarmTypes:[AlarmTypeLoadM]){
//        
//        if alarmTypes.count <= 0{
//            return
//        }
//        
//        //获取队列
//        let aQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//        //将事件添加到队列
//        dispatch_async(aQueue) { () -> Void in
//            
//            let array = ["small", "normal", "big"]
//            for iteam in alarmTypes{
//                //创建NSURL对象
//                //url = "http://112.64.133.198:8096/file/BC_CA100_iphone_small"
//                
//                for  trangle in array
//                {
//                    
//                    let url = APIEnum.getBBaseUrl("AralmImage") + COFileTool.getAlarmTypeUrl(iteam.alarmCode,type: trangle)
//                    
//                    let urls = NSURL(string: url)
//                    if urls == nil{
//                        return
//                    }
//                    
//                    let urlRequest:NSURLRequest = NSURLRequest(URL: urls!)
//                    var responsebig:NSURLResponse?
//                    do{//发送请求
//                        let data:NSData! = try NSURLConnection.sendSynchronousRequest(urlRequest,
//                            returningResponse: &responsebig)
//                        if UIImage(data: data) == nil {//崩溃的地方
//                            return
//                        }
//                        
//                        let image:UIImage = UIImage(data: data)!
//                        let fileName = COFileTool.alarmFileName(iteam.alarmCode,type: trangle)
//                        COFileTool.saveImage(image, fileName: fileName!)
//                        
//                    }catch let error as NSError{//打印错误消息
//                        print(error.code)
//                        print(error.description)
//                    }
//            
//                }
//
//            }
//            
////            //处理回调
////            let mainQueue = dispatch_get_main_queue();
////            dispatch_async(mainQueue, {() -> Void in
////                
////            })
//        }
//        
//    }

        

}
