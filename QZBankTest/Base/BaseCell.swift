//
//  BaseCell.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/22.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class BaseCell: COBaseCell {

	override func createViews() {
		super.createViews()
//		resetAllSetting()   //
		COFontAndColorToTagHandle.setAllFontAndColorWithTag(self.contentView)
	}
}
