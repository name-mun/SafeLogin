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
    
    init() {}
    
    // 회원가입 가능 상태 확인 메서드
    private func checkSigupStatus() {
        // 아이디가 존재하는지 확인
        if let _ = CoreDataManager.shared.fetchUser(id) {
            signupStatusRelay.accept(.idAlreadyExists)
            print("아이디 존재")
        } else if !availableId(id) { // id가 유효한지 확인
            signupStatusRelay.accept(.invalidId)
            print("아이디 형식 확인")
        } else if !availablePassword(password) { // password가 유효한지 확인
            signupStatusRelay.accept(.invalidPassword)
            print("비밀번호 형식 확인")
        } else if password != confirmPassword { // confirmPassword가 올바른지 확인
            signupStatusRelay.accept(.passwordMismatch)
            print("비밀번호 불일치")
        } else {
            CoreDataManager.shared.createUser(id: id, password: password, nickname: nickname)
            signupStatusRelay.accept(.available)
            print("가입 완료")
        }
    }
    
    // 아이디 형식 확인
    func availableId(_ id: String) -> Bool {
        let regex = "^[a-z](?=[a-z0-9]{5,19}@)[a-z0-9]{5,19}@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return emailTest.evaluate(with: id)
    }
    
    // 비밀번호 형식 확인
    func availablePassword(_ password: String) -> Bool {
        let regex = "^(?=.*[A-Za-z].*)(?=.*[0-9]|.*[^A-Za-z0-9]).{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return passwordTest.evaluate(with: password)
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
