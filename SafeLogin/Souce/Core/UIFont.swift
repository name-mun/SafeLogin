//
//  UIFont.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/20/25.
//

import Foundation

import UIKit.UIFont

extension UIFont {
    
    enum System {
        static let medium12 = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        static let semibold16 = UIFont.systemFont(ofSize: 16, weight: .semibold)
        static let medium16 = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        static let semibold20 = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        static let bold24 = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        static let bold40 = UIFont.systemFont(ofSize: 40, weight: .bold)
    }
}
