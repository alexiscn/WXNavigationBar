//
//  MomentsViewController.swift
//  WXNavigationBarDemo
//
//  Created by xushuifeng on 2020/2/24.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import UIKit
import WXNavigationBar

class MomentsViewController: UIViewController {

    private var tableView: UITableView!
    
    private var barTintColor: UIColor = .white
    
    private var statusBarStyle = UIStatusBarStyle.lightContent
    
    private var titleView: UILabel?
    private var rightBarButton: UIButton?
    
    private let navBarHeight: CGFloat = 44.0
    private let headerHeight: CGFloat = 307.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(white: 51.0/255, alpha: 1.0)
        setupTableView()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let offset = self.tableView.contentOffset.y
        let threshold: CGFloat = headerHeight - 70 - 30 - navBarHeight - Constants.statusBarHeight
        let progress = (offset - threshold - navBarHeight)/navBarHeight
        let alpha = max(0, min(progress, 1))
        self.titleView?.isHidden = alpha == 0.0
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.frame)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        view.addSubview(tableView)
        
        let header = MomentHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: headerHeight))
        tableView.tableHeaderView = header
    }
    
    private func setupNavigationBar() {
        
        let titleLabel = UILabel()
        titleLabel.text = "朋友圈"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        navigationItem.titleView = titleLabel
        self.titleView = titleLabel
        
        let rightButtonImage = UIImage(named: "icons_filled_camera")?.withRenderingMode(.alwaysTemplate)
        let rightButtonOutlinedImage = UIImage(named: "icons_outlined_camera")
        let rightButton = UIButton(type: .custom)
        rightButton.setImage(rightButtonImage, for: .normal)
        rightButton.setImage(rightButtonOutlinedImage, for: .selected)
        rightButton.addTarget(self, action: #selector(handleRightBarButtonTapped(_:)), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        rightBarButton = rightButton
        
        wx_navigationBar.alpha = 0.0
    }
    
    private func updateStatusBarStyle(_ style: UIStatusBarStyle) {
        if style != statusBarStyle {
            statusBarStyle = style
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    @objc private func handleRightBarButtonTapped(_ sender: Any) {
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    override var wx_barTintColor: UIColor? { return barTintColor }
}

// MARK: - UITableViewDataSources
extension MomentsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
        cell.textLabel?.text = "Line \(indexPath.row)"
        return cell
    }
}

// MARK: -
extension MomentsViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let y = scrollView.contentOffset.y
        // 70: Avatar Height
        // 30: Avatar Bottom Offset
        let threshold: CGFloat = headerHeight - 70 - 30 - navBarHeight - Constants.statusBarHeight
        if y < threshold {
            wx_navigationBar.alpha = 0.0
            updateStatusBarStyle(.lightContent)
            titleView?.alpha = 0
            titleView?.isHidden = true
            barTintColor = .white
            rightBarButton?.isSelected = false
        } else if y < threshold + navBarHeight {
            updateStatusBarStyle(.default)
            titleView?.alpha = 0
            titleView?.isHidden = true
            barTintColor = .black
            rightBarButton?.isSelected = true
        } else {
            let progress = (y - threshold - navBarHeight)/navBarHeight
            let alpha = max(0, min(progress, 1))
            wx_navigationBar.alpha = alpha
            titleView?.alpha = alpha
            titleView?.isHidden = alpha == 0.0
            updateStatusBarStyle(.default)
            barTintColor = .black
            rightBarButton?.isSelected = true
        }
        if navigationController?.navigationBar.tintColor != barTintColor {
            navigationController?.navigationBar.tintColor = barTintColor
        }
        
    }
    
}
