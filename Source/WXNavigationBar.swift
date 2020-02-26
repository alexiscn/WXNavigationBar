//
//  WXNavigationBar.swift
//  WXNavigationBar
//
//  Created by xushuifeng on 2020/2/26.
//

import UIKit

public class WXNavigationBar: UIView {
    
    /// Global settings of NavigationBar
    public struct NavBar {
        /// Back Image for Navigation Bar
        /// If you want to customize for each view controller,  use `wx_backImage` in view controller
        public static var backImage: UIImage? = Utility.image(named: "wx_nav_back")
        
        public static var backgroundColor: UIColor = UIColor(white: 237.0/255, alpha: 1.0)
        
        public static var tintColor = UIColor(white: 24.0/255, alpha: 1.0)
        
        public static var isShadowImageHidden = true
    }
}
