//
//  ChatRoomViewController_BackgroundColor.swift
//  WXNavigationBarDemo
//
//  Created by xushuifeng on 2020/3/3.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import UIKit

class ChatRoomViewController_BackgroundColor: ChatRoomViewController {
    
    override var wx_navigationBarBackgroundColor: UIColor? {
        return .systemGreen
    }
    
    override var wx_barTintColor: UIColor? {
        return .white
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
