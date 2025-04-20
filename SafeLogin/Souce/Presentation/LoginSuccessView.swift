//
//  LoginSuccessView.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/18/25.
//

import UIKit

final class LoginSuccessView: UIView {
    
    // MARK: - UI Components
    
    // 로고 라벨
    private let logoLabel = UILabel().then {
        $0.text = "SafeLogin"
        $0.textAlignment = .center
    }
    
    // 이름 라벨
    private let nameLabel = UILabel().then {
        $0.textAlignment = .center
    }
    
    // 타이틀 라벨
    private let titleLabel = UILabel().then {
        $0.text = "환영합니다."
        $0.textAlignment = .center
    }

    // 로그아웃 버튼
    let logoutButton = UIButton(type: .system).then {
        $0.backgroundColor = .gray
        $0.tintColor = .white
        $0.layer.cornerRadius = 10
        $0.setTitle("로그아웃", for: .normal)
    }
    
    // 회원탈퇴 버튼
    let deleteAccountButton = UIButton(type: .system).then {
        $0.backgroundColor = .red
        $0.tintColor = .white
        $0.layer.cornerRadius = 10
        $0.setTitle("회원탈퇴", for: .normal)
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
        backgroundColor = .white
        
        [
            logoLabel,
            nameLabel,
            titleLabel,
            logoutButton,
            deleteAccountButton
        ].forEach {
            addSubview($0)
        }
        
        logoLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).inset(10)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        logoutButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(100)
        }
        
        deleteAccountButton.snp.makeConstraints {
            $0.top.equalTo(logoutButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(100)
        }
    }

}

extension LoginSuccessView {
    
    func updateName(_ ninkname: String) {
        nameLabel.text = "\(ninkname)님"
    }
}
