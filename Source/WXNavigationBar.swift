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
        
        /// Background color of WXNavigationBar
        public static var backgroundColor: UIColor = UIColor(white: 237.0/255, alpha: 1.0)
        
        /// Tint Color of WXNavigationBar
        public static var tintColor = UIColor(white: 24.0/255, alpha: 1.0)
        
        /// Shadow Image of WXNavigationBar
        public static var shadowImage: UIImage? = UIImage()
        
    }
    
    public let shadowImageView: UIImageView
    
    public override init(frame: CGRect) {
        
        shadowImageView = UIImageView()
        shadowImageView.contentMode = .scaleAspectFill
        shadowImageView.clipsToBounds = true
        
        super.init(frame: frame)
        
        addSubview(shadowImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let height = 1 / UIScreen.main.scale
        shadowImageView.frame = CGRect(x: 0,
                                       y: bounds.height - height,
                                       width: bounds.width,
                                       height: height)
    }
}
