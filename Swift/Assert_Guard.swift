// 2021.01.08 extramilejin

// assert , guard

// 어플리케이션이 동작 도중에 생성하는 다양한 연산결과를 동적으로 확인하고 안전하게 처리하는 친구들

import Swift

// 1. assert 

    // assert 함수는 디버깅 모드에서만 동작, 배포하는 어플리케이션에서는 제외된다. 예상했던 조건의 검증을 위해 사용.
    
    // 기본 형태
    
    var someInt: Int = 0
    
    assert(someInt == 0, "someInt != 0")

    someInt = 1
    
    assert(someInt == 0, "someInt != 0")    // 이 경우 동작 중지하며 문구를 뱉어냅니다.
    
    func functionWithAssert(age: Int?) {
    
        assert(age != nil, "age == nil")
        
        assert((age! >= 0) && (age! <= 130), "나이값 입력이 잘못되었습니다")
        
        print("당신의 나이는 \(age!)세입니다")
    }


// 2.  guard (빠른 종료)
    
    // 잘못된 값의 전달 시 특정 실행구문을 빠르게 종료한다.
    
    // 디버깅 모드 뿐만 아니라 모든 조건에서 동작한다.
    
    // guard - else 블럭 내부에는 코드 블럭을 종료하는 지시어 (return , break) 가 꼭 있어야 한다.
    
    func funcWithGuard(age: Int?) {
        
        guard let unwrappedAge = age,
            unwrappedAge < 130,
            unwrappedAge >= 0 else {
            print("나이를 잘못 입력하셨습니다.")
            return
        }
        
        print("당신의 나이는 \(unwrappedAge) 입니다.")
    }
    
    funcWithGuard(age: 140)
    
    
// 3. guard를 이용한 옵셔널 바인딩

    var someValue: Int? = 4
    
    if let unwrapped: Int = someValue {
        // statement
        print(unwrapped)
    }
    
    //print(unwrapped) 사용 불가능 if문 밖에서
    
    
    func funcWithGuard2(someValue: Int?) {
        guard let unwrapped: Int = someValue else {
            return
        }
        print(unwrapped)    // 구문 밖에서 사용가능
    }
    
    funcWithGuard2(someValue: 3)
        
  
