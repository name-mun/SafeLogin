//
//  SafeLoginTests.swift
//  SafeLoginTests
//
//  Created by 서문가은 on 4/20/25.
//

import XCTest
@testable import SafeLogin

final class SafeLoginTests: XCTestCase {
    
    // MARK: - 아이디 테스트
    
    // 유효한 아이디
    func test_ValidIdReturnsTrue() throws {
        XCTAssertTrue(UserValidator.isValidId("abcde123@naver.com"))
    }
    
    // 아이디에 숫자가 없을 때
    func test_InvalidIdReturnsFalseWhenIdHasNoNumber() throws {
        XCTAssertFalse(UserValidator.isValidId("Abcde@naver.com"))
    }
    
    // 아이디에 대문자가 있을 떄
    func test_InvalidIdReturnsFalseWhenIdHasUppercase() throws {
        XCTAssertFalse(UserValidator.isValidId("Abcde123@naver.com"))
    }
    
    // 아이디 영역이 20자가 넘을 때
    func test_InvalidIdReturnsFalseWhenIdPartExceeds20Characters() throws {
        XCTAssertFalse(UserValidator.isValidId("Abcde12312313213123123123121312@naver.com"))
    }
    
    // MARK: - 비밀번호 테스트
    
    // 유효한 비밀번호
    func test_ValidPasswordReturnsTrue() throws {
        XCTAssertTrue(UserValidator.isValidId("abcdef12@naver.com"))
    }
    
    // 문자만 사용했을 때
    func test_InvalidPasswordReturnsFalseWhenOnlyLettersInPassword() throws {
        XCTAssertFalse(UserValidator.isValidId("abcdefgh"))
    }
    
    // 비밀번호가 8자보다 작을 때
    func test_InvalidPasswordReturnsFalseWhenPasswordIsLessThan8Characters() throws {
        XCTAssertFalse(UserValidator.isValidId("abcd12"))

    }
}
