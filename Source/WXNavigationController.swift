//
//  WXNavigationController.swift
//  WXNavigationBar
//
//  Created by xushuifeng on 2020/2/23.
//

import UIKit

public class WXNavigationController: UINavigationController {
    
    private var gestureDelegate: _WXNavigationGestureRecognizerDelegate?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        
        gestureDelegate = _WXNavigationGestureRecognizerDelegate(navigationController: self)
        self.interactivePopGestureRecognizer?.delegate = gestureDelegate
    }
    
    override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            //let backButtonItem = UIBarButtonItem(image: Constants.backImage, style: .plain, target: self, action: #selector(backButtonClicked))
            //viewController.navigationItem.leftBarButtonItem = backButtonItem
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc private func backButtonClicked() {
        popViewController(animated: true)
    }
    
    override public var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}

fileprivate class _WXNavigationGestureRecognizerDelegate: NSObject, UIGestureRecognizerDelegate {
    
    fileprivate weak var navigationController: WXNavigationController?
    
    fileprivate init(navigationController: WXNavigationController) {
        self.navigationController = navigationController
    }
}
