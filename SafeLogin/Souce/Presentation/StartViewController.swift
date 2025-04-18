//
//  StartViewController.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/18/25.
//

import UIKit

final class StartViewController: UIViewController {
    
    private let startView = StartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view = startView
    }


}

