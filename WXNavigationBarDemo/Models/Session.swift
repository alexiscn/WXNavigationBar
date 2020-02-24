//
//  Session.swift
//  WXNavigationBarDemo
//
//  Created by xushuifeng on 2020/2/23.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import Foundation

struct Session: Codable {
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case username
        case gender
        case avatar
    }
    
    var identifier: Int
    
    var username: String
    
    var gender: String
    
    var avatar: URL?
    
}
