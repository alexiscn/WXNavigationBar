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
    
    private let session: Session
    
    private let dataSource = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In nibh lorem, porta sed varius id, iaculis sed ligula. Aenean vulputate tempor eleifend. Phasellus risus lacus, ultricies ac ultrices in, faucibus quis odio. Aliquam dapibus condimentum lorem et luctus. Duis eu metus quis lorem laoreet fermentum. Nunc vulputate dui id lacus pharetra, quis suscipit ipsum elementum. Mauris ullamcorper enim orci, nec cursus sem pulvinar et. Maecenas ultrices nibh sed lectus accumsan pretium. Duis viverra eleifend suscipit. Mauris id purus laoreet, sodales lorem dictum, cursus sapien. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque ligula neque, volutpat eleifend arcu eu, faucibus vestibulum justo. Donec sapien est, porta sed vestibulum a, faucibus dignissim tortor.",
        "Vivamus finibus elit purus, id ultricies tellus accumsan sed. Morbi eget libero at tortor sagittis lacinia. Morbi nisi justo, dapibus id nisi sit amet, porttitor rhoncus est. In efficitur vel mauris eu consequat. Mauris semper at eros at gravida. Curabitur malesuada lectus in enim ultrices, quis bibendum dui iaculis. Mauris lobortis nec nisi sed fringilla. Nam quis lectus id tortor sollicitudin dignissim sit amet eget quam. Proin malesuada faucibus lacus sit amet blandit. Nunc urna turpis, bibendum in lorem in, blandit porta ligula. Suspendisse dui nibh, vestibulum eget feugiat in, iaculis vitae eros. Nulla vehicula malesuada malesuada. Morbi et massa sit amet tellus suscipit venenatis.",
        "Nam vestibulum commodo semper. Morbi vel porttitor neque. Integer ornare ipsum in nisi molestie, ac placerat justo elementum. Duis convallis sapien eget laoreet scelerisque. Sed vitae ultricies risus. Quisque rutrum libero quis maximus dapibus. Morbi elit lorem, molestie id tellus lacinia, ultricies eleifend neque. Cras congue sed lorem eget commodo. Etiam velit dui, porttitor eget consectetur sed, ornare nec tortor. Sed id est bibendum, tempus turpis non, scelerisque tortor. Sed non nisl enim. Nunc a elementum lorem.",
        "Donec dignissim libero sit amet venenatis lobortis. Aliquam sit amet rutrum nulla. Etiam et augue gravida, sodales turpis eget, tincidunt justo. Integer justo elit, ornare ac erat quis, pretium scelerisque odio. Cras accumsan finibus risus sit amet venenatis. Donec in libero feugiat, congue urna ut, bibendum lorem. Ut eu mollis nisl. Mauris sodales mattis mollis. Cras mattis diam sapien, vitae rutrum justo rutrum in. Quisque vehicula, nibh ut feugiat finibus, ligula tortor auctor ante, interdum rhoncus mi arcu eu mauris. Duis at finibus sem. Proin vel velit erat. Quisque rutrum porta tempus. Aliquam lobortis ullamcorper sapien, in efficitur ipsum accumsan sit amet. In et ex vestibulum, vestibulum magna mattis, sodales nisl.",
        "Ut id felis vel felis tempor hendrerit. Quisque vestibulum mattis eros, quis eleifend ante gravida eu. Donec mattis sapien nec ornare molestie. Donec vehicula augue a elit sodales vestibulum. Proin cursus ut tortor egestas facilisis. Curabitur accumsan nunc id tellus condimentum, vel maximus nisl aliquam. Nam scelerisque sapien eget sem mollis molestie ut in magna. Praesent ante elit, sodales ut sem egestas, facilisis facilisis arcu. Ut a lectus vel lacus rhoncus pretium a at tellus. Curabitur tempor lorem non nunc vestibulum facilisis. Nullam tristique dolor vitae lectus sodales, at posuere sem pharetra."
    ]
    
    init(session: Session) {
        self.session = session
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //view.backgroundColor = UIColor(white: 237.0/255, alpha: 1.0)
        setupTableView()
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds)
        //tableView.backgroundColor = .clear
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        view.addSubview(tableView)
    }
}

// MARK: - UITableViewDataSource
extension ChatRoomViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension ChatRoomViewController: UITableViewDelegate {
    
}
