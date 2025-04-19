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
    
    case invalidID
    case invalidPassword
    case passwordMismatch
    case available
}

final class SignupViewModel {
    
    private let signupStatusRelay = PublishRelay<SignupStatus>()
    private let disposeBag = DisposeBag()
    
    init() {
        
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
            .subscribe(onNext: { owner, _ in
                
            }).disposed(by: disposeBag)
        
        input.passwordText
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                
            }).disposed(by: disposeBag)
        
        input.confirmPasswordText
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                
            }).disposed(by: disposeBag)
        
        input.nicknameText
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                
            }).disposed(by: disposeBag)
        
        input.signupButtonTapped
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                
            }).disposed(by: disposeBag)
        
        return Output(signupStatus: signupStatusRelay.asDriver(onErrorDriveWith: .empty()))
    }
}
