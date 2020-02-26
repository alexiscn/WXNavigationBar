//
//  UIViewController+WXNavigationBar.swift
//  WXNavigationBar
//
//  Created by xushuifeng on 2020/2/23.
//

import UIKit

/// Exentsions that handle navigation bar
extension UIViewController {
    
    private struct AssociatedKeys {
        static var barBackgroundColor = "barBackgroundColor"
        static var fakeNavigationBar = "fakeNavigationBar"
        static var barBarTintColor = "barBarTintColor"
        static var barTintColor = "barTintColor"
        static var titleTextAttributes = "titleTextAttributes"
        static var useSystemBlurNavBar = "useSystemBlurNavBar"
    }
    
    /// Fake NavigationBar.
    /// Layout inside view controller, below the actual navigation bar which is transparent
    open var wx_navigationBar: WXNavigationBar {
        if let bar = objc_getAssociatedObject(self, &AssociatedKeys.fakeNavigationBar) as? WXNavigationBar {
            return bar
        }
        let bar = WXNavigationBar(frame: .zero)
        objc_setAssociatedObject(self, &AssociatedKeys.fakeNavigationBar, bar, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return bar
    }
    
    /// Background color of fake NavigationBar
    /// Default color is UIColor(white: 237.0/255, alpha: 1.0)
    @objc open var wx_navigationBarBackgroundColor: UIColor? {
        if let color = objc_getAssociatedObject(self, &AssociatedKeys.barBackgroundColor) as? UIColor {
            return color
        }
        let color = WXNavigationBar.NavBar.backgroundColor
        objc_setAssociatedObject(self, &AssociatedKeys.barBackgroundColor, color, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return color
    }
    
    /// Use the system blured navigation bar.
    /// Set to `true` if your want the syatem navigation bar
    @objc open var wx_useSystemBlurNavBar: Bool {
        if let use = objc_getAssociatedObject(self, &AssociatedKeys.useSystemBlurNavBar) as? Bool {
            return use
        }
        let use = false
        objc_setAssociatedObject(self, &AssociatedKeys.useSystemBlurNavBar, use, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return use
    }
    
    /// Bar tint color of navigationbar
    @objc open var wx_barBarTintColor: UIColor? {
        if let barBarTintColor = objc_getAssociatedObject(self, &AssociatedKeys.barBarTintColor) as? UIColor {
            return barBarTintColor
        }
        objc_setAssociatedObject(self, &AssociatedKeys.barBarTintColor, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return nil
    }
    
    /// Tint color of navigationbar
    @objc open var wx_barTintColor: UIColor? {
        if let tintColor = objc_getAssociatedObject(self, &AssociatedKeys.barTintColor) as? UIColor {
            return tintColor
        }
        let tintColor = WXNavigationBar.NavBar.tintColor
        objc_setAssociatedObject(self, &AssociatedKeys.barTintColor, tintColor, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return tintColor
    }
    
    /// Title text attributes of navigationbar
    @objc open var wx_titleTextAttributes: [NSAttributedString.Key: Any]? {
        if let attributes = objc_getAssociatedObject(self, &AssociatedKeys.titleTextAttributes) as? [NSAttributedString.Key: Any] {
            return attributes
        }
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.black]
        objc_setAssociatedObject(self, &AssociatedKeys.titleTextAttributes, attributes, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return attributes
    }
    
    static let wx_swizzle: Void = {
        let cls = UIViewController.self
        swizzleMethod(cls, #selector(UIViewController.viewDidLoad), #selector(UIViewController.wx_viewDidLoad))
        swizzleMethod(cls, #selector(UIViewController.viewWillLayoutSubviews), #selector(UIViewController.wx_viewWillLayoutSubviews))
        swizzleMethod(cls, #selector(UIViewController.viewWillAppear(_:)), #selector(UIViewController.wx_viewWillAppear(_:)))
        swizzleMethod(cls, #selector(UIViewController.viewDidAppear(_:)), #selector(UIViewController.wx_viewDidAppear(_:)))
    }()
    
    @objc private func wx_viewDidLoad() {
        
        if navigationController != nil {
            wx_navigationBar.backgroundColor = wx_navigationBarBackgroundColor
            view.addSubview(wx_navigationBar)
            
            if wx_useSystemBlurNavBar {
                wx_navigationBar.backgroundColor = .clear
                let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
                blurView.frame = CGRect(origin: .zero,
                                        size: CGSize(width: UIScreen.main.bounds.width,
                                                     height: Utility.navigationBarHeight))
                blurView.contentView.backgroundColor = UIColor(white: 229.0/255, alpha: 0.5)
                wx_navigationBar.addSubview(blurView)
            }
        }
        
        wx_viewDidLoad()
    }
    
    @objc private func wx_viewWillLayoutSubviews() {
        if navigationController != nil {
            wx_navigationBar.frame = CGRect(origin: .zero,
                                            size: CGSize(width: UIScreen.main.bounds.width,
                                                         height: Utility.navigationBarHeight))
        }
        wx_viewWillLayoutSubviews()
    }
    
    @objc private func wx_viewWillAppear(_ animated: Bool) {
        if navigationController != nil {
            navigationController?.navigationBar.barTintColor = wx_barBarTintColor
            navigationController?.navigationBar.tintColor = wx_barTintColor
            navigationController?.navigationBar.titleTextAttributes = wx_titleTextAttributes
            view.bringSubviewToFront(wx_navigationBar)
        }
        wx_viewWillAppear(animated)
    }
    
    @objc private func wx_viewDidAppear(_ animated: Bool) {
        if let navigationController = self.navigationController {
            navigationController.interactivePopGestureRecognizer?.isEnabled = navigationController.viewControllers.count > 1
        }
        wx_viewDidAppear(animated)
    }
}

extension UIApplication {
    
    private static let runOnce: Void = {
        UIViewController.wx_swizzle
    }()
    
    override open var next: UIResponder? {
        // Called before applicationDidFinishLaunching
        UIApplication.runOnce
        return super.next
    }
}
