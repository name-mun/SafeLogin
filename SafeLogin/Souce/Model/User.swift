//
//  User.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/19/25.
//

import Foundation

struct User {
    let id: String
    var password: String
    var nickName: String
    
    static func availableId(_ id: String) -> Bool {
        return true
    }
    
    static func availablePassword(_ password: String) -> Bool {
        return true
    }
}
