//
//  Discover.swift
//  WXNavigationBarDemo
//
//  Created by xushuifeng on 2020/2/24.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import UIKit

enum Discover {
    case moment
    case scan
    case shake
    case news
    case search
    case nearby
    case shop
    case game
    case miniProgram
    
    var icon: UIImage? {
        switch self {
        case .moment:
            return UIImage(named: "icons_outlined_colorful_moment")
        case .scan:
            return UIImage(named: "icons_outlined_scan")
        case .shake:
            return UIImage(named: "icons_outlined_shake")
        case .news:
            return UIImage(named: "icons_outlined_news")
        case .search:
            return UIImage(named: "icons_filled_search-logo")
        case .nearby:
            return UIImage(named: "icons_outlined_nearby")
        case .shop:
            return UIImage(named: "icons_outlined_shop")
        case .game:
            return UIImage(named: "icons_outlined_colorful_game")
        case .miniProgram:
            return UIImage(named: "icons_outlined_miniprogram")
        }
    }
    
    var title: String {
        switch self {
        case .moment:
            return "朋友圈"
        case .scan:
            return "扫一扫"
        case .shake:
            return "摇一摇"
        case .news:
            return "看一看"
        case .search:
            return "搜一搜"
        case .nearby:
            return "附近的人"
        case .shop:
            return "购物"
        case .game:
            return "游戏"
        case .miniProgram:
            return "小程序"
        }
    }
}

struct DiscoverGroup {
    
    var items: [Discover]
    
}
