//
//  Contact.swift
//  WXNavigationBarDemo
//
//  Created by xushuifeng on 2020/2/24.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import Foundation

struct Contact: Codable {
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case gender
        case avatar
    }
    
    var identifier: Int
    
    var firstName: String
    
    var lastName: String
    
    var email: String
    
    var gender: String
    
    var avatar: URL?
}

struct ContactGroup {
    
    var tag: String
    
    var contacts: [Contact]
}
