//
//  PaymentViewController.swift
//  WXNavigationBarDemo
//
//  Created by xushuifeng on 2020/2/24.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import UIKit
import WXNavigationBar

class PaymentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 67.0/255, green: 144.0/255, blue: 87.0/255, alpha: 1.0)
        navigationItem.title = "收付款"
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - WXNavigationBar
    override var wx_navigationBarBackgroundColor: UIColor? {
        return UIColor(red: 67.0/255, green: 144.0/255, blue: 87.0/255, alpha: 1.0)
    }
    
    override var wx_barTintColor: UIColor? {
        return UIColor.white
    }
    
    override var wx_titleTextAttributes: [NSAttributedString.Key : Any]? {
        return [NSAttributedString.Key.foregroundColor: UIColor.white]
    }

}
