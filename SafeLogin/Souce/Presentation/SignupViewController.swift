//
//  SignupViewController.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/18/25.
//

import UIKit
import RxSwift

final class SignupViewController: UIViewController {
    
    private let signupView = SignupView()
    private let signupViewModel = SignupViewModel()
    
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        view = signupView
        bind()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
}

// MARK: - Bind

extension SignupViewController {
    
    private func bind() {
        let idText = signupView.idView.inputTextField.rx.text.orEmpty.skip(1).asObservable()
        let passwordText = signupView.passwordView.inputTextField.rx.text.orEmpty.skip(1).asObservable()
        let confirmPasswordText = signupView.confirmPasswordView.inputTextField.rx.text.orEmpty.skip(1).asObservable()
        let nicknameText = signupView.nickNameView.inputTextField.rx.text.orEmpty.skip(1).asObservable()
        let signupButtonTapped = signupView.signupButton.rx.tap.asObservable()
        let input = SignupViewModel.Input(
            idText: idText,
            passwordText: passwordText,
            confirmPasswordText: confirmPasswordText,
            nicknameText: nicknameText,
            signupButtonTapped: signupButtonTapped)
        let output = signupViewModel.transform(input)
        
        output.signupStatus
            .drive(with: self, onNext: { owner, signupStatus in
                switch signupStatus {
                case .idAlreadyExists:
                    print()
                case .invalidId:
                    print()
                case .invalidPassword:
                    print()
                case .passwordMismatch:
                    print()
                case .available: owner.connectLoginSuccessView()
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - 실행 메서드

extension SignupViewController {
    
    private func connectLoginSuccessView() {
        navigationController?.pushViewController(LoginSuccessViewController(), animated: true)
    }
}
