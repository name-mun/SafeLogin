//
//  InputView.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/18/25.
//

import UIKit

import SnapKit
import Then

final class InputView: UIView {
    
    // MARK: - UI Components
    
    // 입력 타이틀 라벨
    private let inputTitleLabel = UILabel().then {
        $0.textAlignment = .left
        $0.font = UIFont.System.semibold16
    }
    
    // 입력 텍스트 필드
    let inputTextField = UITextField().then {
        $0.textAlignment = .left
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        $0.leftViewMode = .always
        $0.font = UIFont.System.medium16
    }
    
    let inputDescriptionLabel = UILabel().then {
        $0.textAlignment = .left
        $0.textColor = .red
        $0.font = UIFont.System.medium12
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(_ inputType: SignUpFieldType) {
        self.init(frame: .zero)
        setupUI()
        setupLabel(inputType)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 레이아웃 구성
    
    private func setupUI() {
        [
            inputTitleLabel,
            inputTextField,
            inputDescriptionLabel
        ].forEach {
            addSubview($0)
        }
        
        inputTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        inputTextField.snp.makeConstraints {
            $0.top.equalTo(inputTitleLabel.snp.bottom).offset(8)
            $0.height.equalTo(48)
            $0.leading.trailing.equalToSuperview()
        }
        
        inputDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(inputTextField.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    private func setupLabel(_ inputType: SignUpFieldType) {
        inputTitleLabel.text = inputType.label
        inputTextField.placeholder = inputType.instruction
    }

}
