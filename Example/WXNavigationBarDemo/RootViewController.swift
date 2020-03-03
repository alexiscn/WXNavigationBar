//
//  RootViewController.swift
//  WXNavigationBarDemo
//
//  Created by xushuifeng on 2020/2/23.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import UIKit
import WXNavigationBar

class RootViewController: UITabBarController {

    private var chatsVC: SessionViewController!
    
    private var discoverVC: DiscoverViewController!
    
    private var meVC: MeViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        chatsVC = SessionViewController()
        chatsVC.title = "WeChat"
        chatsVC.tabBarItem.selectedImage = UIImage(named: "icons_filled_chats")
        chatsVC.tabBarItem.image = UIImage(named: "icons_outlined_chats")?.withRenderingMode(.alwaysOriginal)
        
        discoverVC = DiscoverViewController()
        discoverVC.title = "Discover"
        discoverVC.tabBarItem.selectedImage = UIImage(named: "icons_filled_discover")
        discoverVC.tabBarItem.image = UIImage(named: "icons_outlined_discover")?.withRenderingMode(.alwaysOriginal)
        
        meVC = MeViewController()
        meVC.title = "Me"
        meVC.tabBarItem.selectedImage = UIImage(named: "icons_filled_me")
        meVC.tabBarItem.image = UIImage(named: "icons_outlined_me")?.withRenderingMode(.alwaysOriginal)
        
        let chatsNav = UINavigationController(rootViewController: chatsVC)
        let discoverNav = UINavigationController(rootViewController: discoverVC)
        let meNav = UINavigationController(rootViewController: meVC)
        
        viewControllers = [chatsNav, discoverNav, meNav]
        tabBar.tintColor = UIColor(red: 0.0, green: 194.0/255, blue: 95.0/255, alpha: 1.0)
    }

}
