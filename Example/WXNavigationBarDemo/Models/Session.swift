//
//  Session.swift
//  WXNavigationBarDemo
//
//  Created by xushuifeng on 2020/2/23.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import Foundation

enum Session: CaseIterable {
    
    case transparent
    case backgroundColor
    case backgroundImage
    case shadowImage
    case customBackButtonImage
    
    var title: String {
        switch self {
        case .transparent:
            return "Transparent NavigationBar"
        case .backgroundColor:
            return "NavigationBar Background Color"
        case .backgroundImage:
            return "NavigationBar Background Image"
        case .shadowImage:
            return "Shadow Image"
        case .customBackButtonImage:
            return "Customize Back Button Image"
        }
    }
    
}
