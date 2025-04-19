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
    private let availableIdRelay = PublishRelay<Bool>()
    private let availablePasswordRelay = PublishRelay<Bool>()
    private let availableConfirmPasswordRelay = PublishRelay<Bool>()
    private let availableNicknameRelay = PublishRelay<Bool>()
    private let disposeBag = DisposeBag()
    
    private var id = ""
    private var password = ""
    private var confirmPassword = ""
    private var nickname = ""
    
    init() {}
    
    // 회원가입 가능 상태 확인 메서드
    private func checkSigupStatus() {
        // 아이디가 존재하는지 확인
        if let _ = CoreDataManager.shared.fetchUser(id) {
            signupStatusRelay.accept(.idAlreadyExists)
            print("아이디 존재")
        } else {
            CoreDataManager.shared.createUser(id: id, password: password, nickname: nickname)
            UserDefaults.standard.set(true, forKey: "isLogined")
            signupStatusRelay.accept(.available)
            print("가입 완료")
        }
    }
    
    // 아이디 형식 확인
    private func availableId() {
        let regex = "^[a-z](?=[a-z0-9]{5,19}@)[a-z0-9]{5,19}@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", regex)
        
        if emailTest.evaluate(with: id) {
            availableIdRelay.accept(true)
        } else {
            availableIdRelay.accept(false)
        }
    }
    
    // 비밀번호 형식 확인
    private func availablePassword() {
        let regex = "^(?=.*[A-Za-z].*)(?=.*[0-9]|.*[^A-Za-z0-9]).{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", regex)
        
        if passwordTest.evaluate(with: password) {
            availablePasswordRelay.accept(true)
        } else {
            availablePasswordRelay.accept(false)
        }
    }
    
    private func availableConfirmPassword() {
        if password == confirmPassword {
            availableConfirmPasswordRelay.accept(true)
        } else {
            availableConfirmPasswordRelay.accept(false)
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
        let availableId: Driver<Bool>
        let availablePassword: Driver<Bool>
        let availableConfirmPassword: Driver<Bool>
        let availableNickname: Driver<Bool>
    }
    
    func transform(_ input: Input) -> Output {
        input.idText
            .withUnretained(self)
            .subscribe(onNext: { owner, id in
                owner.id = id
                owner.availableId()
            }).disposed(by: disposeBag)
        
        input.passwordText
            .withUnretained(self)
            .subscribe(onNext: { owner, password in
                owner.password = password
                owner.availablePassword()
            }).disposed(by: disposeBag)
        
        input.confirmPasswordText
            .withUnretained(self)
            .subscribe(onNext: { owner, confirmPassword in
                owner.confirmPassword = confirmPassword
                owner.availableConfirmPassword()
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
        
        return Output(
            signupStatus: signupStatusRelay.asDriver(onErrorDriveWith: .empty()),
            availableId: availableIdRelay.asDriver(onErrorDriveWith: .empty()),
            availablePassword: availablePasswordRelay.asDriver(onErrorDriveWith: .empty()),
            availableConfirmPassword: availableConfirmPasswordRelay.asDriver(onErrorDriveWith: .empty()),
            availableNickname: availableNicknameRelay.asDriver(onErrorDriveWith: .empty())
        )
    }
}
