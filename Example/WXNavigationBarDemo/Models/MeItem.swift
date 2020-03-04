//
//  MeItem.swift
//  WXNavigationBarDemo
//
//  Created by xushuifeng on 2020/3/4.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import Foundation

enum MeItem {
    
    case payment
    case favorite
    case gallery
    case emoticon
    case settings
    
    var title: String {
        switch self {
        case .payment:
            return "Payment"
        case .favorite:
            return "Favorites"
        case .gallery:
            return "Gallery"
        case .emoticon:
            return "Emoticon"
        case .settings:
            return "Settings"
        }
    }
    
    var iconName: String {
        switch self {
        case .payment:
            return "icons_outlined_wechatpay"
        case .favorite:
            return "icons_outlined_colorful_favorites"
        case .gallery:
            return "icons_outlined_album"
        case .emoticon:
            return "icons_outlined_sticker"
        case .settings:
            return "icons_outlined_setting"
        }
    }
}

struct MeItemGroup {
    var items: [MeItem]
}
