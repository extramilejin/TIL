// 2021.01.09 extramilejin

// extension

// 익스텐션은 기존의 구조체, 클래스 , 열거형, 프로토콜 타입에 새로운 기능을 추가 할 수 있는 기능이다.

// 타입의 기능을 확장한다.

// 연산 타입 프로퍼티 / 연산 인스턴스 프로퍼티
// 타입 메서드 /  인스턴스 메서드
// 이니셜라이저
// 서브스크립트
// 중첩 타임
// 특정 프로토콜을 준수하도록 기능 추가

// 단 기존 기능의 재정의는 불가하다.

import Swift

// 1. extension 타입의 

    extension Int {
        var isEven: Bool {
            return self % 2 == 0
        }
        
        var isOdd: Bool {
            return self % 2 == 0
        }
        
        func multiply(by n: Int) -> Int {
            return self * n
        }
    }
    
    print(1.isEven)
    
    print(2.multiply(by: 5))
    
// 2.  extension initializer

    extension String {
        init(intTypeNumber: Int) {
            self = "\(intTypeNumber)"
        }
    }
    
    let stringFromInt: String = String(intTypeNumber: 123)   
    
    print(stringFromInt)

    
