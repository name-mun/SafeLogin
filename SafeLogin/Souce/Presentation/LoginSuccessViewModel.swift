//
//  LoginSuccessViewModel.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/19/25.
//

import Foundation

import RxSwift
import RxCocoa
import RxRelay

enum UserStatus {
    case log
}

final class LoginSuccessViewModel {
    
    private let nicknameRelay = PublishRelay<String>()
    private let successRelay = PublishRelay<Void>()
    private let disposeBag = DisposeBag()
    
    private let userId = ""
    
    init() {}
    
    private func deleteAccount() {
        CoreDataManager.shared.deleteUser(userId)
        UserDefaults.standard.set(false, forKey: "isLogined")
    }
}

extension LoginSuccessViewModel {
    
    struct Input {
        let viewDidLoad: Observable<Void>
        let logoutButtonTapped: Observable<Void>
        let deleteAccountButtonTapped: Observable<Void>
    }
    
    struct Output {
        let nickname: Driver<String>
        let success: Driver<Void>
    }
    
    func transform(_ input: Input) -> Output {
        input.viewDidLoad
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                guard let nickname = UserDefaults.standard.string(forKey: "nickname") else { return }
                owner.nicknameRelay.accept(nickname)
            }).disposed(by: disposeBag)
        
        input.logoutButtonTapped
            .withUnretained(self)
            .subscribe(onNext: { owner, nickname in
                owner.successRelay.accept(())
                UserDefaults.standard.set(false, forKey: "isLogined")
            }).disposed(by: disposeBag)
        
        input.deleteAccountButtonTapped
            .withUnretained(self)
            .subscribe(onNext: { owner, nickname in
                owner.successRelay.accept(())
                owner.deleteAccount()
            }).disposed(by: disposeBag)
        
        return Output(
            nickname: nicknameRelay.asDriver(onErrorDriveWith: .empty()),
            success: successRelay.asDriver(onErrorDriveWith: .empty()))
    }
}
