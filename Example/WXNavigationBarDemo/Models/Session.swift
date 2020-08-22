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
    case customBackButton
    case translucent
    case disableInteractivePopGesture
    case fullscreenInteractivePopGesture
    case presentViewController
    case setViewControllers
    case preferStatusBarHidden
    case flex
    
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
        case .customBackButton:
            return "Customize Back Button"
        case .translucent:
            return "Translucent NavigationBar"
        case .disableInteractivePopGesture:
            return "Disable Interactive Pop Gesture"
        case .fullscreenInteractivePopGesture:
            return "Fullscreen Interactive Pop Gesture"
        case .presentViewController:
            return "Present View Controller"
        case .setViewControllers:
            return "NavigationController setViewControllers"
        case .preferStatusBarHidden:
            return "Preferred StatusBar Hidden"
        case .flex:
            return "FLEX"
        }
    }
    
}
