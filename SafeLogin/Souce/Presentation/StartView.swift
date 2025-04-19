//
//  StartView.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/18/25.
//

import UIKit

import SnapKit
import Then

final class StartView: UIView {
    
    // MARK: - UI Components
    
    // 로고 라벨
    private let logoLabel = UILabel().then {
        $0.text = "SafeLogin"
        $0.textAlignment = .center
    }

    // 시작하기 버튼
    let startButton = UIButton(type: .system).then {
        $0.backgroundColor = .blue
        $0.tintColor = .white
        $0.layer.cornerRadius = 10
        $0.setTitle("시작하기", for: .normal)
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
            startButton
        ].forEach {
            addSubview($0)
        }
        
        logoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        startButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(100)
        }
    }
    
}
