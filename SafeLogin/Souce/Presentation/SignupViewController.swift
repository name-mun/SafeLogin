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
        let idText = signupView.idView.inputTextField.rx.text.orEmpty.skip(2).asObservable()
        let passwordText = signupView.passwordView.inputTextField.rx.text.orEmpty.skip(2).asObservable()
        let confirmPasswordText = signupView.confirmPasswordView.inputTextField.rx.text.orEmpty.skip(2).asObservable()
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
                    owner.signupView.updateIdTextField(false, true)
                case .available: owner.connectLoginSuccessView()
                }
            })
            .disposed(by: disposeBag)
        
        output.availableId
            .skip(1)
            .drive(with: self, onNext: { owner, result in
                owner.signupView.updateIdTextField(result, false)
            })
            .disposed(by: disposeBag)
        
        output.availablePassword
            .skip(1)
            .drive(with: self, onNext: { owner, result in
                owner.signupView.updatePasswordTextField(result)
            })
            .disposed(by: disposeBag)
        
        output.availableConfirmPassword
            .skip(1)
            .drive(with: self, onNext: { owner, result in
                owner.signupView.updateConfirmPasswordTextField(result)
            })
            .disposed(by: disposeBag)
        
        output.availableSignupButton
            .drive(with: self, onNext: { owner, result in
                owner.signupView.updateSignupButton(result)
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
