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

    // 타이틀 라벨
    private let titleLabel = UILabel().then {
        $0.text = "회원가입"
        $0.textAlignment = .center
    }
    
    // 입력 스택 뷰
    private let inputStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.alignment = .center
        $0.spacing = 12
    }
    
    // 아아디 뷰
    private let idView = InputView(.id)
    
    // 비밀번호 뷰
    private let passwordView = InputView(.password)
    
    // 비밀번호 확인 뷰
    private let confirmPasswordView = InputView(.confirmPassword)
    
    // 닉네임 뷰
    private let nickNameView = InputView(.nickName)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 레이아웃 구성

    private func setupUI() {
        backgroundColor = .white
        
        [
            titleLabel,
            inputStackView
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
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).inset(10)
            $0.centerX.equalToSuperview()
        }
        
        inputStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(200)
        }
    }
    
}
