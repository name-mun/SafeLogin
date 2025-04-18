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
    
    private let titleLabel = UILabel().then {
        $0.text = "회원가입"
        $0.textAlignment = .center
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        [
            titleLabel
        ].forEach {
            addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).inset(10)
            $0.centerX.equalToSuperview()
        }
    }
    
}
