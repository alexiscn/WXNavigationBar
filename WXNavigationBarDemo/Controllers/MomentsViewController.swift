//
//  MomentsViewController.swift
//  WXNavigationBarDemo
//
//  Created by xushuifeng on 2020/2/24.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import UIKit

class MomentsViewController: UIViewController {

    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
}

// MARK: - UITableViewDataSources
extension MomentsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
        return cell
    }
}

// MARK: -
extension MomentsViewController: UITableViewDelegate {
    
}
