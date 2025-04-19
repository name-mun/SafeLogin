//
//  User.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/19/25.
//

import Foundation

struct User {
    let ID: String
    var password: String
    var nickName: String
    
    func availableID() -> Bool {
        return true
    }
    
    func availablePassword() -> Bool {
        return true
    }
}
