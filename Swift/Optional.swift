// 2021.01.05 extramilejin

// Optional 

import Swift


// 1. Optional

    // 값이 있을 수도, 없을 수도 있음을 표현 -> nil이 할당 될 수 있느냐?
    
    // nil의 가능성을 코드만으로 표현함으로서 문서/주석 작성시간 절약, nil체크 할지 말지 고민 x
    
    // 예외 상황 최소화, 효율적 코딩.
    
    // enum Optional<Wrapped>: ExpressibleByNiliteral {
    //      case none
    //      case some(Wrapped)
    // }
    
    // Optional은 열거형으로 정의되어 있으며 값이 없으면 none 케이스, 있으면 some 케이스
    
    
// 2. Implicitly Unwrapped Optional : 암시적 추출 옵셔널

    // nil을 할당하고 싶은데 옵셔널 바인딩을 안쓰고 싶거나 런타임 오류가 발생하지 않을 것 같을 때,
    
    // 일반 변수처럼 사용 가능하고 nil 할당도 된다.

    var iuo: Int! = 100
    
    switch iuo {
        case .none:
            print("This Optional variable is nil")
        case .some(let value):
            print("Value is \(value)")
    }
    

// 3. Optional 선언
    
    let optionalValue: Optional<Int> = nil
    
    let optionalValue2: Int? = nil
    
    var optionalValue3: Int! = 200
    
    optionalValue3 = optionalValue3 + 1
    
    optionalValue3 = nil
    
// 4. Optional 추출

    // 값이 있을 수도 있고 없을 수도 있는데 추출은?
    
    // Forced Unwrapping
    
    // optional 값 뒤에 ! 를 붙혀주면 값을 강제로 추출한다. 런타임 오류가 발생하기 쉽다.
    
    var name: String? = "extramilejin"
    
    var personName = name!
    
    print(personName)
    
    name = nil
    
    // personName = name -> 컴파일 오류
    
    
    // Optional Binding 
    
    // if let, 임시로 상수 할당을 하여 값을 넣어 줄 수 있다. var 로도 할당 가능하다.
    
    // 할당된 임시 상수는 if let 구문안에서만 사용 가능 하다.
    
    // ,(comma)를 이용하여 여러 옵셔널을 바인딩 할 수 있다. (모든 옵셔널에 값이 존재할 때만 동작)
    
    name = "extramilejin"

    if let getName = name {
        print("My name is \(getName)")
    } else {
        print("name은 nil 입니다.")
    }
    
   
// 5. nil 병합 연산자

    // A ?? B    :  A가 nil이 아니면 A반환, A가 nil 이면 B반환

    var optionalInt: Int? = 100
    
    var someInt: Int = optionalInt ?? 0
    
    print(someInt)

    optionalInt = nil
    
    print(optionalInt ?? 0) // 0
    
    
