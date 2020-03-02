//
//  ContactsViewController.swift
//  WXNavigationBarDemo
//
//  Created by xushuifeng on 2020/2/23.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import UIKit
import Kingfisher

class ContactsViewController: UIViewController {

    private var tableView: UITableView!
    
    private var dataSource: [ContactGroup] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(white: 237.0/255, alpha: 1.0)
        setupTableView()
        setupDataSource()
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.separatorColor = UIColor(white: 0, alpha: 0.15)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.indexDisplayMode = .automatic
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        view.addSubview(tableView)
    }

    private func setupDataSource() {
        DispatchQueue.global().async {
            guard let url = Bundle.main.url(forResource: "contacts", withExtension: "json"),
                let data = try? Data(contentsOf: url) else {
                return
            }
            do {
                let contacts = try JSONDecoder().decode([Contact].self, from: data)
                let groupingDict = Dictionary(grouping: contacts, by: { String($0.firstName.first!) })
                var groups = groupingDict.map { ContactGroup(tag: $0.key, contacts: $0.value) }
                groups.sort(by: { $0.tag < $1.tag })
                DispatchQueue.main.async {
                    self.dataSource = groups
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension ContactsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let group = dataSource[section]
        return group.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = dataSource[indexPath.section].contacts[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
        cell.imageView?.frame.size = CGSize(width: 40, height: 40)
        let placeholder = UIImage(named: "DefaultHead_48x48_")
        cell.imageView?.kf.setImage(with: contact.avatar, placeholder: placeholder)
        cell.textLabel?.text = "\(contact.firstName) \(contact.lastName)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0.01 : 32.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            return nil
        }
        
        let title = dataSource[section].tag
        let headerLabel = UILabel(frame: CGRect(x: 16, y: 0, width: view.bounds.width - 32, height: 32))
        headerLabel.text = title.uppercased()
        headerLabel.textColor = UIColor(white: 0, alpha: 0.5)
        headerLabel.font = UIFont.systemFont(ofSize: 14)
        let header = UIView()
        header.addSubview(headerLabel)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return dataSource.map { $0.tag }
    }
}

// MARK: - UITableViewDelegate
extension ContactsViewController: UITableViewDelegate {
    
}
