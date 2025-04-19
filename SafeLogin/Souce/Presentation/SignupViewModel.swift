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
    
    case idAlreadyExists
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
        
        // 아이디가 존재하는지 확인
        if let _ = CoreDataManager.shared.fetchUser(id) {
            signupStatusRelay.accept(.idAlreadyExists)
            print("가입 불가")
        } else if !User.availableId(id) { // id가 유효한지 확인
            signupStatusRelay.accept(.invalidId)
        } else if !User.availablePassword(password) { // password가 유효한지 확인
            signupStatusRelay.accept(.invalidPassword)
        } else if password != confirmPassword { // confirmPassword가 올바른지 확인
            signupStatusRelay.accept(.passwordMismatch)
        } else {
            CoreDataManager.shared.createUser(id: id, password: password, nickname: nickname)
            signupStatusRelay.accept(.available)
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
