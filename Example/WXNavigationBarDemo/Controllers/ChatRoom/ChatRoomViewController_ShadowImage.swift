//
//  ChatRoomViewController_ShadowImage.swift
//  WXNavigationBarDemo
//
//  Created by xushuifeng on 2020/3/3.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import UIKit

class ChatRoomViewController_ShadowImage: ChatRoomViewController {
 
    override var wx_shadowImage: UIImage? {
        return UIImage(named: "icon_shadow")
    }
    
    override var wx_navigationBarBackgroundColor: UIColor? {
        return .secondarySystemBackground
    }
    
}
