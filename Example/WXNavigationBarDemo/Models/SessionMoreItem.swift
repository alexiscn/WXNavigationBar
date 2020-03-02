//
//  SessionMoreItem.swift
//  WXNavigationBarDemo
//
//  Created by xushuifeng on 2020/2/24.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import Foundation

struct SessionMoreItem {
    
    var type: MoreItemType
    
    var title: String
    
    var icon: String
    
    enum MoreItemType {
        case groupChats
        case addFriends
        case scan
        case money
    }
}
