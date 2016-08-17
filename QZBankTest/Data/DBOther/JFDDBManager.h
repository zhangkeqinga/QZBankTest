//
//  JFDDBManager.h
//  TaiShou
//
//  Created by zhgz on 12-6-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//


//
#ifdef DEBUG
#define DLog(...) NSLog(__VA_ARGS__)
#define DMethod() NSLog(@"%s", __func__)
#else
#define DLog(...)
#define DMethod()
#endif


#import <Foundation/Foundation.h>
#import "DBAccess.h"
#import "SqlModel.h"
#import "JFDCustomerUtil.h"


//@class QuestionM;

@interface JFDDBManager : NSObject{
    
}

+ (JFDDBManager *)sharedInstance;

//- (QuestionM *)questionList:(NSString*)questionid_ typeId:(NSString*)typeid_;


/*

- (NSMutableArray *)allHospitalList;
- (void)insertHospital:(QuestionM *)question;
*/


//测试例子
- (SqlModel *)queryModel:(int)i_id;
- (void)deleteModel:(SqlModel*)model;
- (void)insertModel:(SqlModel*)model;
- (void)updataModel:(SqlModel*)model;

@end

