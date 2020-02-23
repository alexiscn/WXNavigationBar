//
//  Constants.swift
//  WXNavigationBar
//
//  Created by xushuifeng on 2020/2/23.
//

import UIKit

struct Constants {
    
    static let defaultBackgroundColor = UIColor(white: 237.0/255, alpha: 1.0)
    
    static let defaultTintColor = UIColor(white: 24.0/255, alpha: 1.0)
    
    static let defaultNavBarBackgroundColor = UIColor(white: 229.0/255, alpha: 1.0)
    
    static var navigationBarHeight: CGFloat {
        let top = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
        return top > 0 ? 88.0 : 64.0
    }
    
    static let screenWidth = UIScreen.main.bounds.width
    
    static let screenHeight = UIScreen.main.bounds.height
}
