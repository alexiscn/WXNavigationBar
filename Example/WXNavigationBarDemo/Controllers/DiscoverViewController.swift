//
//  DiscoverViewController.swift
//  WXNavigationBarDemo
//
//  Created by xushuifeng on 2020/2/23.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController {

    private var tableView: UITableView!
    
    private var dataSource: [DiscoverGroup] = []
    
    private lazy var momentVC: MomentsViewController = {
       return MomentsViewController()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDataSource()
        setupTableView()
    }
    
    private func setupDataSource() {
        dataSource.append(DiscoverGroup(items: [.moment]))
        dataSource.append(DiscoverGroup(items: [.scan, .shake]))
        dataSource.append(DiscoverGroup(items: [.news, .search]))
        dataSource.append(DiscoverGroup(items: [.nearby]))
        dataSource.append(DiscoverGroup(items: [.shop, .game]))
        dataSource.append(DiscoverGroup(items: [.miniProgram]))
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        view.addSubview(tableView)
    }
    
    override var wx_navigationBarBackgroundColor: UIColor? {
        return .systemPink
    }
}

// MARK: - UITableViewDataSource
extension DiscoverViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let discover = dataSource[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
        cell.imageView?.image = discover.icon
        cell.textLabel?.text = discover.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0.01 : 8.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}

// MARK: - UITableViewDelegate
extension DiscoverViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let discover = dataSource[indexPath.section].items[indexPath.row]
        switch discover {
        case .moment:
            navigationController?.pushViewController(momentVC, animated: true)
        default:
            break
        }
    }
}
