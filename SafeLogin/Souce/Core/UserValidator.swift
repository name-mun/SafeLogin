//
//  UserValidator.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/20/25.
//

import Foundation

struct UserValidator {
    
    // 아이디 유효성 검사
    static func isValidId(_ id: String) -> Bool {
        let regex = "^[a-z](?=[a-z0-9]{5,19}@)[a-z0-9]{5,19}@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: id)
    }
    
    // 비밀번호 유효성 검사
    static func isValidPassword(_ password: String) -> Bool {
        let regex = "^(?=.*[A-Za-z].*)(?=.*[0-9]|.*[^A-Za-z0-9]).{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: password)
    }
}
