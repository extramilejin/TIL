// 2021.01.10 extramilejin

// map, filter, reduce

// Higher-Order Function는 다른 함수를 전달인자로 받거나 함수 실행 결과를 함수로 반환하는 함수를 뜻한다.

// map, filter, reduce는 Swift 표준 라이브러리의 컨테이너 타입 Array, Set, Diciotionary에 구현되어 있다.

import Swift

// 1. map 

    // 다른 함수를 전달인자로 받아서 처리한 map 메서드
    // 컨테이너 내부의 기존 데이터를 변형하여 새로운 컨테이너를 생성한다.

    let numbers: [Int] = [1,2,3,4,5]
    var doubledNumbers: [Int]
    var stringNumbers: [String]
    
    doubledNumbers = numbers.map({(number: Int) -> Int in 
    
        return number * 2
    
    })
    
    stringNumbers = numbers.map({(number: Int) -> String in
        
        return "\(number)"
        
    })
    
    print(doubledNumbers)   // [2, 4, 6, 8, 10]
    print(stringNumbers)    // ["1", "2", "3", "4", "5"]
    
    
// 2. filter

    // filter 메서드는 컨테이너 내부의 값을 말그대로 걸러서 새로운 컨테이너로 추출한다.
        
    let filteredNumbers: [Int]
    
    filteredNumbers = numbers.filter({(number: Int) -> Bool in
        return number % 2 == 0      // Bool값을 반환한다.
    })
    
    print(filteredNumbers) // [2, 4]
    
    
    // 후행클로저 버전
    
    let oddNumbers: [Int] = numbers.filter {
        $0 % 2 != 0
    }
    
    print(oddNumbers) // [1, 3, 5]
    
    
// 3. reduce

    // reduce는 컨테이너 내부의 콘텐츠를 하나로 통합한다.
    
    let sum: Int = numbers.reduce(0,{(first: Int, second: Int) -> Int in    // 0이 초깃값이다. 
        print("\(first) + \(second)")
        return first + second
    })
    
    print(sum)
    
    // 0 + 1
    // 1 + 2
    // 3 + 3
    // 6 + 4
    // 10 + 5
    // 15
