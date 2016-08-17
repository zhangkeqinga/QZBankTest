//
//  DBAccess.h
//  iSIPCity
//
//  Created by  on 12-1-9.
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
#import "FMDatabase.h"
#import "PathUtilities.h"


@interface DBAccess : NSObject{
    
    FMDatabase *db;
}

+ (DBAccess *)sharedInstance;

- (BOOL)runSQL:(id) sqlStr;


-(NSMutableArray *)queryDataToObjArrary:(NSString*)sqlStr type:(Class)type;

-(id)queryDataToObj:(NSString*)sqlStr type:(Class)type;


-(NSMutableArray *)queryDataToArray:(NSString*)sqlStr;


-(NSMutableArray *)queryDataToDictionary:(NSString*)sqlStr;




@end


