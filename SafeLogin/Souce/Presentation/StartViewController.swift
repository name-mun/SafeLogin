//
//  StartViewController.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/18/25.
//

import UIKit

final class StartViewController: UIViewController {
    
    private let startView = StartView()
    
    override func loadView() {
        view = startView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // 버튼 액션 연결
    private func setupAction() {
        // 시작 버튼 액션 연결
        startView.startButton.addAction(UIAction{ [weak self] _ in
            guard let self else { return }
            self.handleLoginFlow()
        }, for: .touchUpInside)
    }
    
    private func handleLoginFlow() {
        // 로그인 여부 확인
        if UserDefaults.standard.bool(forKey: "isLogined") {
            navigationController?.pushViewController(LoginSuccessViewController(), animated: true)
        } else {
            navigationController?.pushViewController(SignupViewController(), animated: true)
        }
    }
}
