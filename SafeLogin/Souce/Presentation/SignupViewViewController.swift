//
//  SignupViewViewController.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/18/25.
//

import UIKit

final class SignupViewViewController: UIViewController {
    
    private let signupView = SignupView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view = signupView
    }
    
}
