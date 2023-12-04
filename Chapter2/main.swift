//
//  main.swift
//  Chapter2
//
//  Created by Jason Yang on 12/4/23.
//

import Foundation
/*
var name = "peter"
var myProperty : Int = 20 {
    willSet {
        //myProperty의 값이 변경된 직후에 호출, oldVal은 변경 전 myProperty의 값
        print("현재 이름 = \(name), 바뀔 이름 = \(newValue)")
    }
    didSet {
       print("현재 이름 = \(name), 바뀌기 전 이름 = \(oldValue)")
    }
}
*/
class UserAccount {
    var username: String
    var password: String
    var loginAttempts: Int = 0 {
        // didSet은 새 값이 저장된 직후에 호출, 이전 프로퍼티의 값이 oldValue로 제공
        // 변수에 프로퍼티 옵저버를 정의하여 프로퍼티 값의 변경사항을 모니터링(값을 계속 넣는다), 미리 구현한 코드로 대응
        // 변경사항이 발생할 때 실행된다.
        didSet {
            if loginAttempts >= 5 {
                print("로그인 시도가 3회 이상 실패하였습니다. 계정이 잠겼습니다.")
                lockAccount()
            }
        }
    }
    
    var isLocked: Bool = false {
        didSet {
            if isLocked {
                print("계정이 잠겼습니다.")
            } else {
                print("계정이 잠금 해제되었습니다.")
            }
        }
    }
    // 초기화 함수
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    func login(with enteredPassword: String) {
        if enteredPassword == password {
            print("로그인 성공!")
            loginAttempts = 0 // 로그인 성공 시 로그인 시도 횟수 초기화
        } else {
            print("잘못된 비밀번호입니다.")
            loginAttempts += 1 // 로그인 실패 시 로그인 시도 횟수 증가
        }
    }
    
    private func lockAccount() {
        isLocked = true
    }
    
    func unlockAccount() {
        isLocked = false
    }
}

// 사용자 계정 생성
let user = UserAccount(username: "user123", password: "password123")

// 로그인 시도
user.login(with: "wrongpassword")
// 출력:
// 잘못된 비밀번호입니다.

user.login(with: "wrongpassword")
// 출력:
// 잘못된 비밀번호입니다.

user.login(with: "wrongpassword")
// 출력:
// 잘못된 비밀번호입니다.
// 로그인 시도가 3회 이상 실패하였습니다. 계정이 잠겼습니다.
// 계정이 잠겼습니다.

// 계정 잠금 해제
user.unlockAccount() // 계정이 잠금 해제되었습니다.



