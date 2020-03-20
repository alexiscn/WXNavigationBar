//
//  PresentViewController.swift
//  WXNavigationBarDemo
//
//  Created by xushuifeng on 2020/3/20.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGroupedBackground
        
        title = "Presented"
        
        let closeButtonItem = UIBarButtonItem(image: UIImage(named: "icons_filled_close"), style: .plain, target: self, action: #selector(closeButtonClicked))
        navigationItem.leftBarButtonItem = closeButtonItem
    }
    
    @objc private func closeButtonClicked() {
        dismiss(animated: true, completion: nil)
    }
    
    override var wx_navigationBarBackgroundColor: UIColor? {
        return .systemRed
    }
    
    override var wx_barTintColor: UIColor? {
        return .white
    }
    
    override var wx_titleTextAttributes: [NSAttributedString.Key : Any]? {
        return [
            .foregroundColor: UIColor.white
        ]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
