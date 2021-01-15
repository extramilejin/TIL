// 2021.01.05 extramilejin

// Enum 

import Swift


// 1. Enum

    // 유사한 종류의 여러 값을 한 곳에 모아서 정의한 것이다.
    // enum 자체가 하나의 데이터 타입으로, 대문자 카멜케이스를 이용하여 정의한다.
    // 각 case 는 소문자 카멜케이스로 정의, case 그 자체가 고유의 값 (자동으로 정수값이 할당 되지 않는다.)
    
    
// 2. Enum의 선언과 사용
    
    enum Weekday {
        case mon
        case tue
        case wed
        case thu,fri,sat,sun
    }
    
    // 열거형 타입과 케이스를 사용가능.
    
    var today: Weekday = Weekday.mon
    
    today = .wed
    
    print(today)
    
    switch today {
        
        case .mon, .tue, .wed, .thu:
            print("평일")
        case .fri:
            print("불금")
        case .sat, .sun:
            print("주말")
            
    }
    
    // C언어 처럼 정수값을 가질 수 있고 자동 증가 해서 할당 가능하다.
    
    // 정수 뿐만 아니라 Hashable 프로토콜을 따르는 모든 타입을 원시값의 타입으로 지정 가능하다.
    
    enum Language: Int {
        case cpp = 0
        case python = 1
        case java 
        case swift
    }
    
    var favorite: Language = Language.swift
    
    print("\(favorite)'s rawValue is \(favorite.rawValue)")
    
    // swift's rawValue is 3
    
    // 원시값을 통해 초기화 가능하지만 case가 없을 수 도 있기떄문에 초기화된 인스턴스는 Optional 타입 이다.
    
    let cpplus: Language? = Language(rawValue: 0)
    
    if let cplusplus = cpplus {
        print("rawValue 0에 해당 \(cplusplus)")
    } else {
        print("rawValue 0에 해당 하는 케이스는 없다.")
    }
    
    // rawValue 0에 해당 cpp
    

// 3. Enum method
    
    enum Month {
        case dec, jan, feb
        case mar, apr, may
        case jun, jul, aug
        case sep, oct, nov
        
        func printMessage() {
            switch self {
            case .mar, .apr, .may:
                print("Spring")
            case .jun, .jul, .aug:
                print("Summer")
            case .sep, .oct, .nov:
                print("Fall")
            case .dec, .jan, .feb:
                print("Winter")
            }
        }
    }

    Month.mar.printMessage() //Spring
    
    
