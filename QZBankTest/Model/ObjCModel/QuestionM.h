//
//  QuestionM.h
//  QZBankTest
//
//  Created by mac on 16/8/7.
//  Copyright © 2016年 com.cn.QZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionM : NSObject

@property(nonatomic,retain)  NSString * questionid; //Int = 0     //问题id
@property(nonatomic,retain)  NSString * question;   //String = "" //问题内容
@property(nonatomic,retain)  NSString * type_id;    //String = "" //问题类型id
@property(nonatomic,retain)  NSString * type_name;  //String = "" //问题名称

@property(nonatomic,retain)  NSString * answer_r;//String = ""   //正确答案
@property(nonatomic,retain)  NSString * anwser_a;//String = ""   //答案A
@property(nonatomic,retain)  NSString * anwser_b;//String = ""   //答案B
@property(nonatomic,retain)  NSString * anwser_c;//String = ""   //答案C
@property(nonatomic,retain)  NSString * anwser_d;//String = ""   //答案D


@end
