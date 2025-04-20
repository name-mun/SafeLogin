//
//  LoginSuccessViewController.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/18/25.
//

import UIKit

import RxSwift

final class LoginSuccessViewController: UIViewController {

    private let loginSuccessView = LoginSuccessView()
    private let loginSuccessViewModel = LoginSuccessViewModel()
    
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        view = loginSuccessView
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
}

// MARK: - Bind

extension LoginSuccessViewController {
    
    private func bind() {
        let viewDidLoad = rx.methodInvoked(#selector(viewDidLoad)).map { _ in }
        let logoutButtonTapped = loginSuccessView.logoutButton.rx.tap.asObservable()
        let deleteAccountButtonTapped = loginSuccessView.deleteAccountButton.rx.tap.asObservable()
        let input = LoginSuccessViewModel.Input(
            viewDidLoad: viewDidLoad,
            logoutButtonTapped: logoutButtonTapped,
            deleteAccountButtonTapped: deleteAccountButtonTapped)
        let output = loginSuccessViewModel.transform(input)
        
        output.nickname
            .drive(with: self, onNext: { owner, nickname in
                owner.loginSuccessView.updateName(nickname)
            })
            .disposed(by: disposeBag)
        
        output.success
            .drive(with: self, onNext: { owner, _ in
                owner.navigationController?.pushViewController(StartViewController(), animated: true)
            })
            .disposed(by: disposeBag)
    }
}
