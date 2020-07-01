//
//  ChatRoomViewController_StatusBarHidden.swift
//  WXNavigationBarDemo
//
//  Created by xu.shuifeng on 2020/7/1.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import UIKit

class ChatRoomViewController_StatusBarHidden: ChatRoomViewController {
    
    private var hiddenStatusBar = false {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return hiddenStatusBar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Configure StatusBar"
        
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        
        let changeButton = UIBarButtonItem(title: "Change", style: .plain, target: self, action: #selector(onChangeButtonClicked))
        navigationItem.rightBarButtonItem = changeButton
    }
    
    @objc private func onChangeButtonClicked() {
        hiddenStatusBar.toggle()
    }
}
