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
    
    private var contactsVC: ContactsViewController!
    
    private var discoverVC: DiscoverViewController!
    
    private var meVC: MeViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        chatsVC = SessionViewController()
        chatsVC.title = "微信"
        chatsVC.tabBarItem.selectedImage = UIImage(named: "icons_filled_chats")
        chatsVC.tabBarItem.image = UIImage(named: "icons_outlined_chats")?.withRenderingMode(.alwaysOriginal)
        
        contactsVC = ContactsViewController()
        contactsVC.title = "通讯录"
        contactsVC.tabBarItem.selectedImage = UIImage(named: "icons_filled_contacts")
        contactsVC.tabBarItem.image = UIImage(named: "icons_outlined_contacts")?.withRenderingMode(.alwaysOriginal)
        
        discoverVC = DiscoverViewController()
        discoverVC.title = "发现"
        discoverVC.tabBarItem.selectedImage = UIImage(named: "icons_filled_discover")
        discoverVC.tabBarItem.image = UIImage(named: "icons_outlined_discover")?.withRenderingMode(.alwaysOriginal)
        
        meVC = MeViewController()
        meVC.title = "我"
        meVC.tabBarItem.selectedImage = UIImage(named: "icons_filled_me")
        meVC.tabBarItem.image = UIImage(named: "icons_outlined_me")?.withRenderingMode(.alwaysOriginal)
        
        let chatsNav = UINavigationController(rootViewController: chatsVC)
        let contactsNav = UINavigationController(rootViewController: contactsVC)
        let discoverNav = UINavigationController(rootViewController: discoverVC)
        let meNav = UINavigationController(rootViewController: meVC)
        
        viewControllers = [chatsNav, contactsNav, discoverNav, meNav]
        tabBar.tintColor = UIColor(red: 0.0, green: 194.0/255, blue: 95.0/255, alpha: 1.0)
    }

}
