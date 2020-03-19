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
        static var navigationBar = "WXNavigationBar_navigationBar"
        static var navigationBarBackgroundColor = "WXNavigationBar_navigationBarBackgroundColor"
        static var navigationBarBackgroundImage = "WXNavigationBar_navigationBarBackgroundImage"
        
        static var barBarTintColor = "WXNavigationBar_barBarTintColor"
        static var barTintColor = "WXNavigationBar_barTintColor"
        static var titleTextAttributes = "WXNavigationBar_titleTextAttributes"
        static var useSystemBlurNavBar = "WXNavigationBar_useSystemBlurNavBar"
        static var shadowImage = "WXNavigationBar_shadowImage"
        static var shadowImageTintColor = "WXNavigationBar_shadowImageTintColor"
        static var backButtonCustomView = "WXNavigationBar_backButtonCustomView"
        static var backImage = "WXNavigationBar_backImage"
        
        static var disableInteractivePopGesture = "WXNavigationBar_disableInteractivePopGesture"
        static var fullScreenInteractiveEnabled = "WXNavigationBar_fullScreenInteractivePopEnabled"
        static var interactivePopMaxAllowedInitialDistanceToLeftEdge = "WXNavigationBar_interactivePopMaxAllowedInitialDistanceToLeftEdge"
        
        // For internal usage
        static var willDisappear = "WXNavigationBar_willDisappear"
    }
    
    /// Fake NavigationBar.
    /// Layout inside view controller, below the actual navigation bar which is transparent
    open var wx_navigationBar: WXNavigationBar {
        if let bar = objc_getAssociatedObject(self, &AssociatedKeys.navigationBar) as? WXNavigationBar {
            return bar
        }
        let bar = WXNavigationBar(frame: .zero)
        objc_setAssociatedObject(self, &AssociatedKeys.navigationBar, bar, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return bar
    }
    
    /// Background color of fake NavigationBar
    /// Default color is UIColor(white: 237.0/255, alpha: 1.0)
    @objc open var wx_navigationBarBackgroundColor: UIColor? {
        if let color = objc_getAssociatedObject(self, &AssociatedKeys.navigationBarBackgroundColor) as? UIColor {
            return color
        }
        let color = WXNavigationBar.NavBar.backgroundColor
        objc_setAssociatedObject(self,
                                 &AssociatedKeys.navigationBarBackgroundColor,
                                 color,
                                 .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return color
    }
    
    /// Background Image for Navigation Bar in View Controller
    @objc open var wx_navigationBarBackgroundImage: UIImage? {
        if let backgroundImage = objc_getAssociatedObject(self, &AssociatedKeys.navigationBarBackgroundImage) as? UIImage {
            return backgroundImage
        }
        let backgroundImage = WXNavigationBar.NavBar.backgroundImage
        objc_setAssociatedObject(self,
                                 &AssociatedKeys.navigationBarBackgroundImage,
                                 backgroundImage,
                                 .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return backgroundImage
    }
    
    /// Use the system blured navigation bar.
    /// Set to `true` if your want the syatem navigation bar
    @objc open var wx_useSystemBlurNavBar: Bool {
        if let useSystemBlurNavBar = objc_getAssociatedObject(self, &AssociatedKeys.useSystemBlurNavBar) as? Bool {
            return useSystemBlurNavBar
        }
        let useSystemBlurNavBar = false
        objc_setAssociatedObject(self,
                                 &AssociatedKeys.useSystemBlurNavBar,
                                 useSystemBlurNavBar,
                                 .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return useSystemBlurNavBar
    }
    
    /// Bar tint color of navigationbar
    @objc open var wx_barBarTintColor: UIColor? {
        if let barBarTintColor = objc_getAssociatedObject(self, &AssociatedKeys.barBarTintColor) as? UIColor {
            return barBarTintColor
        }
        let barBarTintColor: UIColor? = nil
        objc_setAssociatedObject(self,
                                 &AssociatedKeys.barBarTintColor,
                                 barBarTintColor,
                                 .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return barBarTintColor
    }
    
    /// Tint color of navigationbar
    @objc open var wx_barTintColor: UIColor? {
        if let barTintColor = objc_getAssociatedObject(self, &AssociatedKeys.barTintColor) as? UIColor {
            return barTintColor
        }
        let barTintColor = WXNavigationBar.NavBar.tintColor
        objc_setAssociatedObject(self,
                                 &AssociatedKeys.barTintColor,
                                 barTintColor,
                                 .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return barTintColor
    }
    
    /// Title text attributes of navigationbar
    @objc open var wx_titleTextAttributes: [NSAttributedString.Key: Any]? {
        if let attributes = objc_getAssociatedObject(self, &AssociatedKeys.titleTextAttributes) as? [NSAttributedString.Key: Any] {
            return attributes
        }
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.black]
        objc_setAssociatedObject(self,
                                 &AssociatedKeys.titleTextAttributes,
                                 attributes,
                                 .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return attributes
    }
    
    /// ShadowImage of Navigation Bar
    @objc open var wx_shadowImage: UIImage? {
        if let shadowImage = objc_getAssociatedObject(self, &AssociatedKeys.shadowImage) as? UIImage {
            return shadowImage
        }
        let shadowImage = WXNavigationBar.NavBar.shadowImage
        objc_setAssociatedObject(self,
                                 &AssociatedKeys.shadowImage,
                                 shadowImage,
                                 .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return shadowImage
    }
    
    /// Use `wx_shadowImageTintColor` to create shadowImage. The default value is nil.
    /// Note: if `wx_shadowImageTintColor` is set, `wx_shadowImage` will be ignored.
    @objc open var wx_shadowImageTintColor: UIColor? {
        if let shadowImageTintColor = objc_getAssociatedObject(self, &AssociatedKeys.shadowImageTintColor) as? UIColor {
            return shadowImageTintColor
        }
        let shadowImageTintColor: UIColor? = nil
        objc_setAssociatedObject(self,
                                 &AssociatedKeys.shadowImageTintColor,
                                 shadowImageTintColor,
                                 .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return shadowImageTintColor
    }

    /// NavigationBar back image
    @objc open var wx_backImage: UIImage? {
        if let backImage = objc_getAssociatedObject(self, &AssociatedKeys.backImage) as? UIImage {
            return backImage
        }
        let backImage = WXNavigationBar.NavBar.backImage
        objc_setAssociatedObject(self,
                                 &AssociatedKeys.backImage,
                                 backImage,
                                 .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return backImage
    }
    
    /// A custom view for back button. eg: you can create a label to display the back button.
    @objc open var wx_backButtonCustomView: UIView? {
        if let backButtonCustomView = objc_getAssociatedObject(self, &AssociatedKeys.backButtonCustomView) as? UIView {
            return backButtonCustomView
        }
        let backButtonCustomView = WXNavigationBar.NavBar.backButtonCustomView
        objc_setAssociatedObject(self,
                                 &AssociatedKeys.backButtonCustomView,
                                 backButtonCustomView,
                                 .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return backButtonCustomView
    }
    
    /// A Boolean value indicating whether interactive pop gesture is disbabled. `false` by default.
    @objc open var wx_disableInteractivePopGesture: Bool {
        if let disableInteractivePopGesture = objc_getAssociatedObject(self, &AssociatedKeys.disableInteractivePopGesture) as? Bool {
            return disableInteractivePopGesture
        }
        let disableInteractivePopGesture = false
        objc_setAssociatedObject(self,
                                 &AssociatedKeys.disableInteractivePopGesture,
                                 disableInteractivePopGesture,
                                 .OBJC_ASSOCIATION_ASSIGN)
        return disableInteractivePopGesture
    }
    
    /// A Boolean value indicating whether fullscreen pop gesture is enabled.
    /// The default value of this property is `WXNavigationBar.NavBar.fullscreenPopGestureEnabled`.
    @objc open var wx_fullScreenInteractivePopEnabled: Bool {
        if let fullScreenInteractivePopEnabled = objc_getAssociatedObject(self, &AssociatedKeys.fullScreenInteractiveEnabled) as? Bool {
            return fullScreenInteractivePopEnabled
        }
        let fullScreenInteractivePopEnabled = WXNavigationBar.NavBar.fullscreenPopGestureEnabled
        objc_setAssociatedObject(self,
                                 &AssociatedKeys.fullScreenInteractiveEnabled,
                                 fullScreenInteractivePopEnabled,
                                 .OBJC_ASSOCIATION_ASSIGN)
        return fullScreenInteractivePopEnabled
    }
    
    /// The initial distance to left edge allow to interactive pop gesture.
    /// 0 by default, which means no limit.
    @objc open var wx_interactivePopMaxAllowedInitialDistanceToLeftEdge: CGFloat {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.interactivePopMaxAllowedInitialDistanceToLeftEdge) as? CGFloat ?? 0.0
        }
        set {
            objc_setAssociatedObject(self,
                                     &AssociatedKeys.interactivePopMaxAllowedInitialDistanceToLeftEdge,
                                     newValue,
                                     .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    private var wx_willDisappear: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.willDisappear) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self,
                                     &AssociatedKeys.willDisappear,
                                     newValue,
                                     .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    static let wx_swizzle: Void = {
        let cls = UIViewController.self
        swizzleMethod(cls, #selector(UIViewController.viewDidLoad), #selector(UIViewController.wx_viewDidLoad))
        swizzleMethod(cls, #selector(UIViewController.viewWillAppear(_:)), #selector(UIViewController.wx_viewWillAppear(_:)))
        swizzleMethod(cls, #selector(UIViewController.viewDidAppear(_:)), #selector(UIViewController.wx_viewDidAppear(_:)))
        swizzleMethod(cls, #selector(UIViewController.viewWillDisappear(_:)), #selector(UIViewController.wx_viewWillDisappear(_:)))
    }()
    
    @objc private func wx_viewDidLoad() {
        if navigationController != nil {
            navigationController?.configureNavigationBar()
            // configure fake navigationBar
            wx_navigationBar.backgroundColor = wx_navigationBarBackgroundColor
            wx_navigationBar.shadowImageView.image = wx_shadowImage
            if let color = wx_shadowImageTintColor {
                wx_navigationBar.shadowImageView.image = Utility.imageFrom(color: color)
            }
            wx_navigationBar.backgroundImageView.image = wx_navigationBarBackgroundImage
            wx_navigationBar.frame = CGRect(x: 0,
                                            y: 0,
                                            width: view.bounds.width,
                                            height: Utility.navigationBarHeight)
            if wx_useSystemBlurNavBar {
                wx_navigationBar.useSystemBlurEffect()
            }
            // Fix when ViewController is UITableViewController, the root view is UITableView
            // and wx_navigation layout is wrong.
            if view is UITableView {
                navigationController?.view.insertSubview(wx_navigationBar, at: 1)
            } else {
                view.addSubview(wx_navigationBar)
            }
        }
        
        wx_viewDidLoad()
    }
    
    @objc private func wx_viewWillAppear(_ animated: Bool) {
        if navigationController != nil {
            navigationController?.navigationBar.barTintColor = wx_barBarTintColor
            navigationController?.navigationBar.tintColor = wx_barTintColor
            navigationController?.navigationBar.titleTextAttributes = wx_titleTextAttributes
            view.bringSubviewToFront(wx_navigationBar)
        }
        navigationController?.navigationBar.frameUpdatedHandler = { [weak self] newFrame in
            guard let self = self else { return }
            // Avoid frame update when swipe back from large title mode to normal
            if self.wx_willDisappear {
                return
            }
            let frame = CGRect(x: 0,
                               y: 0,
                               width: newFrame.width,
                               height: newFrame.height + newFrame.origin.y)
            self.wx_navigationBar.frame = frame
        }
        wx_willDisappear = false
        wx_viewWillAppear(animated)
    }
    
    @objc private func wx_viewWillDisappear(_ animated: Bool) {
        wx_willDisappear = true
        wx_viewWillDisappear(animated)
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
        UINavigationController.wx_navswizzle
        UIViewController.wx_swizzle
        UINavigationBar.wx_swizzle
    }()
    
    override open var next: UIResponder? {
        // Called before applicationDidFinishLaunching
        UIApplication.runOnce
        return super.next
    }
}
