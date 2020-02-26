//
//  MomentHeaderView.swift
//  WXNavigationBarDemo
//
//  Created by xushuifeng on 2020/2/26.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import UIKit

class MomentHeaderView: UITableViewHeaderFooterView {
    
    private let imageView: UIImageView
    
    override init(reuseIdentifier: String?) {
        
        imageView = UIImageView()
        imageView.image = UIImage(named: "moment_cover")
        
        super.init(reuseIdentifier: reuseIdentifier)
        
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let y = Constants.statusBarHeight + 44.0
        imageView.frame = CGRect(x: 0, y: -y, width: bounds.width, height: bounds.height + y)
    }
    
}
