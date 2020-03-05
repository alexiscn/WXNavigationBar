//
//  ChatRoomViewController_CustomBackButton.swift
//  WXNavigationBarDemo
//
//  Created by xushuifeng on 2020/3/5.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import UIKit

class ChatRoomViewController_CustomBackButton: ChatRoomViewController {
    
    override var wx_backButtonCustomView: UIView? {
        
        let label = UILabel()
        label.text = "back"
        label.textAlignment = .center
        
        return label
    }
    
}
