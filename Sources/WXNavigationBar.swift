//
//  WXNavigationBar.swift
//  WXNavigationBar
//
//  Created by xushuifeng on 2020/2/26.
//

import UIKit

public class WXNavigationBarManger {
    public static let shared = WXNavigationBarManger()
    /// 黑名单
    var blackUINavigationControllers: Set<String> = []
    
    /// 启动 WXNavigationBar黑名单，黑名单内的UINavigationController将关闭WXNavigationBar
    /// - Parameter blackUINavigationControllers: 黑名单（类名字符串集合）
    public func setup(_ blackUINavigationControllers: Set<String> = []) {
        self.blackUINavigationControllers = blackUINavigationControllers
    }
}

public class WXNavigationBar: UIView {
    
    /// Global settings of NavigationBar
    public struct NavBar {
        
        /// Back Image for Navigation Bar
        /// If you want to customize for each view controller,  use `wx_backImage` in view controller
        public static var backImage: UIImage? = Utility.backImage
        
        /// Use custom view to create back button.
        /// Note: You do not need to add tap event to custom view. It's handled in WXNavigationBar.
        public static var backButtonCustomView: UIView? = nil
        
        /// Background Image for NavigationBar
        public static var backgroundImage: UIImage? = nil
        
        /// Background color for NavigationBar
        public static var backgroundColor: UIColor = UIColor(white: 237.0/255, alpha: 1.0)
        
        /// Tint Color for NavigationBar
        public static var tintColor = UIColor(white: 24.0/255, alpha: 1.0)
        
        /// Shadow Image for NavigationBar
        public static var shadowImage: UIImage? = UIImage()
        
        /// A Boolean value indicating whether fullscreen pop gesture is enabled.
        public static var fullscreenPopGestureEnabled = false
    }
    
    /// Bottom line
    public let shadowImageView: UIImageView
    
    /// Container View where you put your custom view
    public let containerView: UIView
    
    /// Background ImageView
    public let backgroundImageView: UIImageView
    
    public let visualEffectView: UIVisualEffectView
    
    public override init(frame: CGRect) {
        
        backgroundImageView = UIImageView()
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        
        shadowImageView = UIImageView()
        shadowImageView.contentMode = .scaleAspectFill
        shadowImageView.clipsToBounds = true
        
        containerView = UIView()
        
        let effect: UIBlurEffect
        if #available(iOS 13, *) {
            effect = UIBlurEffect(style: .systemChromeMaterial)
        } else {
            effect = UIBlurEffect(style: .extraLight)
        }
        
        visualEffectView = UIVisualEffectView(effect: effect)
        visualEffectView.isHidden = true
        visualEffectView.contentView.backgroundColor = WXNavigationBar.NavBar.backgroundColor.withAlphaComponent(0.5)
        
        super.init(frame: frame)
        
        addSubview(backgroundImageView)
        addSubview(visualEffectView)
        addSubview(shadowImageView)
        addSubview(containerView)
        
        backgroundImageView.image = WXNavigationBar.NavBar.backgroundImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        visualEffectView.frame = bounds
        backgroundImageView.frame = bounds
        
        var safeAreaTop: CGFloat = 20.0
        if #available(iOS 11, *) {
            safeAreaTop = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 44.0
        }
        containerView.frame = CGRect(x: 0, y: safeAreaTop, width: bounds.width, height: bounds.height - safeAreaTop)
        
        let lineHeight = 1 / UIScreen.main.scale
        shadowImageView.frame = CGRect(x: 0,
                                       y: bounds.height - lineHeight,
                                       width: bounds.width,
                                       height: lineHeight)
    }
    
    func enableBlurEffect(_ enabled: Bool) {
        if enabled {
            backgroundColor = .clear
            backgroundImageView.isHidden = true
            visualEffectView.isHidden = false
        }
    }
    
    /// Add subview to containerView
    public func add(_ subView: UIView) {
        containerView.addSubview(subView)
    }
    
    public static func setup(_ blackUINavigationControllers: Set<String> = []) {
        WXNavigationBarManger.shared.setup(blackUINavigationControllers)
        UIApplication.runOnce
    }
}
