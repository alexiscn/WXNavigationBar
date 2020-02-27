//
//  ChatRoomViewController.swift
//  WXNavigationBarDemo
//
//  Created by xushuifeng on 2020/2/23.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import UIKit
import WXNavigationBar

class ChatRoomViewController: UIViewController {

    private var tableView: UITableView!
    
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(white: 237.0/255, alpha: 1.0)
        
        title = username
        setupTableView()
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds)
        tableView.backgroundColor = .clear
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        view.addSubview(tableView)
    }
    
    // MARK: - WXNavigationBar
    
    override var wx_useSystemBlurNavBar: Bool {
        return true
    }
    
    override var wx_navigationBarBackgroundImage: UIImage? {
        return UIImage(named: "icon_nav_bg")
    }
}

// MARK: - UITableViewDataSource
extension ChatRoomViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
        cell.backgroundColor = .red
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension ChatRoomViewController: UITableViewDelegate {
    
}
