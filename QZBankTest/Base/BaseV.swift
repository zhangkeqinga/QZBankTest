//
//  BaseV.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/18.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class BaseV: COBaseV {

	override func createViews() {
		super.createViews()
		COFontAndColorToTagHandle.setAllFontAndColorWithTag(self)
	}
}
