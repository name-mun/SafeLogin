//
//  SignupViewModel.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/19/25.
//

import Foundation

import RxSwift
import RxRelay
import RxCocoa

enum SignupStatus {
    
    case invalidId
    case invalidPassword
    case passwordMismatch
    case available
}

final class SignupViewModel {
    
    private let signupStatusRelay = PublishRelay<SignupStatus>()
    private let disposeBag = DisposeBag()
    
    private var id = ""
    private var password = ""
    private var confirmPassword = ""
    private var nickname = ""
    
    init() {
        
    }
    
    // 회원가입 가능 상태 확인 메서드
    private func checkSigupStatus() {
        
        // TODO: - 아이디가 존재하는지 확인
        
        if !User.availableId(id) {
            signupStatusRelay.accept(.invalidId)
        } else if !User.availablePassword(password) {
            signupStatusRelay.accept(.invalidPassword)
        } else if password != confirmPassword {
            signupStatusRelay.accept(.passwordMismatch)
        } else {
            let user = User(id: id, password: password, nickName: nickname)
            // TODO: - 코어데이터에 유저 정보 저장
            signupStatusRelay.accept(.available)
        }
    }
    
    private func checkId() {
        if !User.availableId(id) {
            signupStatusRelay.accept(.invalidId)
        }
        
        // 아이디가 중복되는지 체크
    }
    
    private func checkPassword() {
        if !User.availablePassword(password) {
            signupStatusRelay.accept(.invalidPassword)
        }
        
        if password != confirmPassword {
            signupStatusRelay.accept(.passwordMismatch)
        }
    }
}

extension SignupViewModel {
    
    struct Input {
        let idText: Observable<String>
        let passwordText: Observable<String>
        let confirmPasswordText: Observable<String>
        let nicknameText: Observable<String>
        let signupButtonTapped: Observable<Void>
    }
    
    struct Output {
        let signupStatus: Driver<SignupStatus>
    }
    
    func transform(_ input: Input) -> Output {
        input.idText
            .withUnretained(self)
            .subscribe(onNext: { owner, id in
                owner.id = id
            }).disposed(by: disposeBag)
        
        input.passwordText
            .withUnretained(self)
            .subscribe(onNext: { owner, password in
                owner.password = password
            }).disposed(by: disposeBag)
        
        input.confirmPasswordText
            .withUnretained(self)
            .subscribe(onNext: { owner, confirmPassword in
                owner.confirmPassword = confirmPassword
            }).disposed(by: disposeBag)
        
        input.nicknameText
            .withUnretained(self)
            .subscribe(onNext: { owner, nickname in
                owner.nickname = nickname
            }).disposed(by: disposeBag)
        
        input.signupButtonTapped
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                owner.checkSigupStatus()
            }).disposed(by: disposeBag)
        
        return Output(signupStatus: signupStatusRelay.asDriver(onErrorDriveWith: .empty()))
    }
}
