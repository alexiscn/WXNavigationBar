//
//  MMNavigationController.swift
//  WXNavigationBarDemo
//
//  Created by xu.shuifeng on 2020/5/20.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import UIKit

class MMNavigationController: UINavigationController {
    
}


extension MMNavigationController {
    
    override var wx_enableWXNavigationBar: Bool {
        get {
            return true
        }
        set {
            super.wx_enableWXNavigationBar = newValue
        }
    }
}
