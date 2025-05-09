//
//  SignupView.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/18/25.
//

import UIKit

import SnapKit
import Then

final class SignupView: UIView {
    
    // MARK: - UI Components
    
    // 입력 스택 뷰
    private let inputStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.alignment = .center
    }
    
    // 아아디 뷰
    let idView = InputView(.id)
    
    // 비밀번호 뷰
    let passwordView = InputView(.password)
    
    // 비밀번호 확인 뷰
    let confirmPasswordView = InputView(.confirmPassword)
    
    // 닉네임 뷰
    let nickNameView = InputView(.nickName)
    
    // 회원가입 버튼
    let signupButton = UIButton(type: .system).then {
        $0.setTitle("가입하기", for: .normal)
        $0.tintColor = .white
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 12
        $0.isEnabled = false
        $0.titleLabel?.font = UIFont.System.semibold16
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 레이아웃 구성

    private func setupUI() {
        backgroundColor = .background
        
        [
            inputStackView,
            signupButton
        ].forEach {
            addSubview($0)
        }
        
        [
            idView,
            passwordView,
            confirmPasswordView,
            nickNameView
        ].forEach {
            inputStackView.addArrangedSubview($0)
            $0.snp.makeConstraints {
                $0.leading.trailing.equalToSuperview()
            }
        }
        
        inputStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).inset(20)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(440)
        }

        signupButton.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(20)
            $0.horizontalEdges.equalToSuperview().inset(12)
        }
    }
}


extension SignupView {
    
    func updateIdTextField(_ isAvailable: Bool, _ isAccountProblem: Bool) {
        if !isAvailable {
            self.idView.inputTextField.layer.borderColor = UIColor.red.cgColor
            let text = isAccountProblem ? "존재하는 아이디입니다." : "이메일(@이후) 제외하고 6~20자, 영문 소문자와 숫자만, 숫자 시작 불가"
            self.idView.inputDescriptionLabel.text = text
        } else {
            self.idView.inputTextField.layer.borderColor = UIColor.gray.cgColor
            self.idView.inputDescriptionLabel.text = ""
        }
    }
    
    func updatePasswordTextField(_ isAvailable: Bool) {
        if !isAvailable {
            self.passwordView.inputTextField.layer.borderColor = UIColor.red.cgColor
            self.passwordView.inputDescriptionLabel.text = "숫자, 영문, 특수문자 중 2개 이상 조합, 최소 8자"
        } else {
            self.passwordView.inputTextField.layer.borderColor = UIColor.gray.cgColor
            self.passwordView.inputDescriptionLabel.text = ""
        }
    }
    
    func updateConfirmPasswordTextField(_ isAvailable: Bool) {
        if !isAvailable {
            self.confirmPasswordView.inputTextField.layer.borderColor = UIColor.red.cgColor
            self.confirmPasswordView.inputDescriptionLabel.text = "비밀번호가 일치하지 않습니다."
        } else {
            self.confirmPasswordView.inputTextField.layer.borderColor = UIColor.gray.cgColor
            self.confirmPasswordView.inputDescriptionLabel.text = ""
        }
    }
    
    func updateSignupButton(_ isAvailable: Bool) {
        if !isAvailable {
            self.signupButton.isEnabled = false
            self.signupButton.backgroundColor = .gray
        } else {
            self.signupButton.isEnabled = true
            self.signupButton.backgroundColor = .accent
        }
    }
}
