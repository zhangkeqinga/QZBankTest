//
//  JFDDBManager.m
//  TaiShou
//
//  Created by zhgz on 12-6-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//


//#import "QZBankTest-swift.h"

#import "JFDDBManager.h"


static JFDDBManager *dbManager = nil;


@implementation JFDDBManager

+ (JFDDBManager *)sharedInstance {
    
    if (!dbManager) {
        dbManager = [[JFDDBManager alloc] init];
    }
    return dbManager;
}


/**
 @abstract
 @param NSString  doctorId_
 @return DoctorModel
 @author by 张克清
 */


//- (QuestionM *)questionList:(NSString*)questionid_ typeId:(NSString*)typeid_{
//
//    NSString *sql=[NSString stringWithFormat:@"select * from QuestionM s where s.id='%@'",questionid_];
//    //    DLog(@"%@",sqlString);
//    
//    QuestionM *doctor=[[QuestionM alloc]init];
//
//    if ([[DBAccess sharedInstance]queryDataToObj:sql type:NSClassFromString(@"QuestionM")]) {
//        doctor = [[DBAccess sharedInstance]queryDataToObj:sql type:NSClassFromString(@"QuestionM")];
//        
//    }
//    
//    return doctor;
//}


/**
 @abstract
 @param
 @return DoctorModel
 @author by Frank
 */

/*
- (NSMutableArray *)allHospitalList{
    
    NSString *sql=[NSString stringWithFormat:@"select * from QuestionM"];
    
    NSMutableArray *hospitalList=[[NSMutableArray alloc]init];
    
    if ([[DBAccess sharedInstance] queryDataToObjArrary:sql type:NSClassFromString(@"QuestionM")]) {
        hospitalList=[[DBAccess sharedInstance] queryDataToObjArrary:sql type:NSClassFromString(@"QuestionM")];
        
    }
    
    return hospitalList;
}
*/
//

/**
 @abstract 插入医院数据
 @param
 @return DoctorModel
 @author by Frank
 */

/*
-(void)insertHospital:(QuestionM *)hospital_{
    NSDate * today = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateFormat:@"dd-MM-yyyy"];
    NSString *dateString = [NSString stringWithFormat:@"%@", [formatter stringFromDate:today]];
    
    NSString *sql=[NSString stringWithFormat:@"insert into  hospital(createTime) values('%@')",dateString];
    
    [[DBAccess sharedInstance]runSQL:sql];
    
}
*/



#pragma mark -- sql test
//
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//

/**
 *  查询测试数据库
 *
 *  @param i_id 编号
 *
 *  @return 内容描述
 */

- (SqlModel *)queryModel:(int)i_id{
    
    NSString *sql=[NSString stringWithFormat:@"select * from SqlModel s where s.i_id='%d'",i_id];
    //    DLog(@"%@",sqlString);
    
    SqlModel *model=[[SqlModel alloc]init];
    
    if ([[DBAccess sharedInstance]queryDataToObj:sql type:NSClassFromString(@"SqlModel")]) {
        model = [[DBAccess sharedInstance]queryDataToObj:sql type:NSClassFromString(@"SqlModel")];
        
    }
    
    return model;

}

- (void)deleteModel:(SqlModel*)model{
    
}

- (void)insertModel:(SqlModel*)model{
    
}

- (void)updataModel:(SqlModel*)model{
    
}




@end
