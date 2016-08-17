//
//  DBSwiftHandle.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/9/17.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//数据库操作－ 建表

import UIKit

class DBSwiftHandle: BaseHandle {
    
    //注册表
    class func registerTables(){
        
        DynamicMessageM.getUsingLKDBHelper().getTableCreatedWithTableName(DynamicMessageM.getTableName())
        
        PersonM.getUsingLKDBHelper().getTableCreatedWithTableName(PersonM.getTableName())
        
        PersonGroupM.getUsingLKDBHelper().getTableCreatedWithTableName(PersonGroupM.getTableName())
        
        PersonGroupRelateM.getUsingLKDBHelper().getTableCreatedWithTableName(PersonGroupRelateM.getTableName())
        
        //关注建表
        AttentionM.getUsingLKDBHelper().getTableCreatedWithTableName(AttentionM.getTableName())
        
        
        //通讯录建表
        ContactPeopleM.getUsingLKDBHelper().getTableCreatedWithTableName(ContactPeopleM.getTableName())
        
        //故障关系表
        FaultRelationsM.getUsingLKDBHelper().getTableCreatedWithTableName(FaultRelationsM.getTableName())
        
        //k报警类型
        //报警类型建表
        AlarmTypeM.getUsingLKDBHelper().getTableCreatedWithTableName(AlarmTypeM.getTableName())
        
        //品牌信息
        BrandM.getUsingLKDBHelper().getTableCreatedWithTableName(AlarmTypeM.getTableName())
        
        //维保服务修复保存
        FixAllItemsInfoM.getUsingLKDBHelper().getTableCreatedWithTableName(FixAllItemsInfoM.getTableName())
        
        //维保服务消息保存
        MessageServiceInfoM.getUsingLKDBHelper().getTableCreatedWithTableName(MessageServiceInfoM.getTableName())
        
        //巡检处理
        InspectionItemDbInfo.getUsingLKDBHelper().getTableCreatedWithTableName(InspectionItemDbInfo.getTableName())
    }
    
    
}
