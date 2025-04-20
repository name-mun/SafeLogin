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
        $0.font = UIFont.System.semibold20
        $0.textColor = .accent
    }
    
    // 이름 라벨
    private let nameLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont.System.bold40
    }
    
    // 타이틀 라벨
    private let titleLabel = UILabel().then {
        $0.text = "환영합니다✨"
        $0.textAlignment = .center
        $0.font = UIFont.System.semibold20
    }

    // 로그아웃 버튼
    let logoutButton = UIButton(type: .system).then {
        $0.backgroundColor = .accent
        $0.tintColor = .white
        $0.layer.cornerRadius = 10
        $0.setTitle("로그아웃", for: .normal)
        $0.titleLabel?.font = UIFont.System.semibold16
    }
    
    // 회원탈퇴 버튼
    let deleteAccountButton = UIButton(type: .system).then {
        $0.backgroundColor = .gray
        $0.tintColor = .white
        $0.layer.cornerRadius = 10
        $0.setTitle("회원탈퇴", for: .normal)
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
            $0.centerY.equalToSuperview().offset(-40)
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        logoutButton.snp.makeConstraints {
            $0.bottom.equalTo(deleteAccountButton.snp.top).offset(-20)
            $0.height.equalTo(52)
            $0.horizontalEdges.equalToSuperview().inset(12)
        }
        
        deleteAccountButton.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(20)
            $0.horizontalEdges.equalToSuperview().inset(12)
        }
    }

}

extension LoginSuccessView {
    
    func updateName(_ ninkname: String) {
        nameLabel.text = "\(ninkname)님"
    }
}
