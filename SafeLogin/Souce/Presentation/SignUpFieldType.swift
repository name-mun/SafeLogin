//
//  SignUpFieldType.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/18/25.
//

enum SignUpFieldType {
    case id
    case password
    case confirmPassword
    case nickName
    
    var label: String {
        switch self {
        case .id: return "아이디"
        case .password: return "비밀번호"
        case .confirmPassword: return "비밀번호 확인"
        case .nickName: return "닉네임"
        }
    }
    
    var instruction: String {
        switch self {
        case .id: return "아이디 입력(이메일 형식)"
        case .password: return "비밀번호(숫자, 영문, 특수문자 조합 최소 8자)"
        case .confirmPassword: return "비밀번호 확인"
        case .nickName: return "닉네임"
        }
    }
}
