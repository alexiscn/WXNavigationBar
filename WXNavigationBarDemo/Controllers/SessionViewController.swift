//
//  SessionViewController.swift
//  WXNavigationBarDemo
//
//  Created by xushuifeng on 2020/2/23.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import UIKit

class SessionViewController: UIViewController {

    private var tableView: UITableView!
    
    private var dataSource: [String] = []
    
    private lazy var menuFloatView: SessionMoreFrameFloatView = {
        let y = Constants.statusBarHeight + 44
        let frame = CGRect(x: 0, y: y, width: view.bounds.width, height: view.bounds.height - y)
        let floatView = SessionMoreFrameFloatView(frame: frame)
        floatView.delegate = self
        return floatView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(white: 237.0/255, alpha: 1.0)
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        let rightButtonItem = UIBarButtonItem(image: UIImage(named: "icons_outlined_addoutline"), style: .done, target: self, action: #selector(handleRightBarButtonTapped(_:)))
        navigationItem.rightBarButtonItem = rightButtonItem
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds)
        tableView.backgroundColor = .clear
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        view.addSubview(tableView)
    }

    @objc private func handleRightBarButtonTapped(_ sender: Any) {
        if self.menuFloatView.superview != nil {
            hideMoreMenu()
        } else {
            showMoreMenu()
        }
    }
    
    private func showMoreMenu() {
        menuFloatView.show(in: self.view)
    }
    
    private func hideMoreMenu(animated: Bool = true) {
        menuFloatView.hide(animated: animated)
    }
    
}

// MARK: - UITableViewDataSource
extension SessionViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SessionViewController: UITableViewDelegate {
    
}

// MARK: - SessionMoreMenuViewDelegate
extension SessionViewController: SessionMoreMenuViewDelegate {
    
    func moreMenuView(_ menu: SessionMoreMenuView, didTap item: SessionMoreItem) {
        switch item.type {
        case .money:
            let paymentVC = PaymentViewController()
            navigationController?.pushViewController(paymentVC, animated: true)
        default:
            break
        }
        hideMoreMenu(animated: false)
    }
}
