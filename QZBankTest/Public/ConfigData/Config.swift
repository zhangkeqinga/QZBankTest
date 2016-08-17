//
//  Config.swift
//  COXbry
//
//  Created by carlosk on 15/1/5.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//  配置文件  开关文件

import Foundation

struct Config {
	
    //内网
//	IsHttpInernalTest
	#if IsHttpInernalTest
	//自定义
	static let IsHttpInernalTest = true
	#else
	static let IsHttpInernalTest = false
	#endif
	
	
	#if IsHttpTest
		static let IsHttpTest = true
	#else
		#if IsCustom
		//自定义
		static let IsHttpTest = true
		#else
		static let IsHttpTest = false
		#endif
	#endif
	
   
    #if IsShowLog
	static let IsPrintLog = true
	static let IsPrintHttpLog = true
	#else
    static let IsPrintLog = false
	static let IsPrintHttpLog = false
	#endif
	
    
    #if IsAppstore
    static let IsAppstore = true
    #else
    static let IsAppstore = false
    #endif
    
	
    #if IsPublicServer
	static let IsPublicServer = true
	#else
	static let IsPublicServer = false
	#endif



}