//
//  SignUpViewModel.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/19/25.
//

import Foundation

import RxSwift
import RxRelay
import RxCocoa

enum SignUpStatus {
    
    case invalidID
    case invalidPassword
    case passwordMismatch
    case available
}

final class SignUpViewModel {
    
    private let signupStatusRelay = PublishRelay<SignUpStatus>()
    private let disposeBag = DisposeBag()
    
    init() {
        
    }
}

extension SignUpViewModel {
    
    struct Input {
        let idText: Observable<String>
        let password: Observable<String>
        let confirmPasswordText: Observable<String>
        let nicknameText: Observable<String>
        let createButtonTapped: Observable<Void>
    }
    
    struct Output {
        let signupStatus: Driver<SignUpStatus>
    }
    
    func transform(_ input: Input) -> Output {
        input.idText
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                
            }).disposed(by: disposeBag)
        
        input.password
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
        
        input.createButtonTapped
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                
            }).disposed(by: disposeBag)
        
        return Output(signupStatus: signupStatusRelay.asDriver(onErrorDriveWith: .empty()))
    }
}
