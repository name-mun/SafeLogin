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
    
    // 로고 이미지
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "logo")
        $0.contentMode = .scaleAspectFit
    }
    
    // 로고 라벨
    private let logoLabel = UILabel().then {
        $0.text = "SafeLogin"
        $0.textColor = .accent
        $0.textAlignment = .center
    }
    
    // 설명 라벨
    private let descriptionLabel = UILabel().then {
        $0.text = "빠르고 안전하게 로그인하세요!"
        $0.textAlignment = .center
    }

    // 시작하기 버튼
    let startButton = UIButton(type: .system).then {
        $0.backgroundColor = .accent
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
            logoImage,
            logoLabel,
            descriptionLabel,
            startButton
        ].forEach {
            addSubview($0)
        }
        
        logoImage.snp.makeConstraints {
            $0.bottom.equalTo(logoLabel.snp.top).offset(-16)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(150)
        }
        
        logoLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoLabel.snp.bottom).offset(12)
        }
        
        startButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(20)
            $0.height.equalTo(52)
            $0.horizontalEdges.equalToSuperview().inset(12)
        }
    }
    
}
