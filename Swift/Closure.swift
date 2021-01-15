// 2021.01.06 extramilejin
// Closure
import Swift

// 1. basic Closure
    let nums: Array<Int> = [4,1,2,0,32,9,14]
    
    let orderedNums: Array<Int> = nums.sorted(by:{(first: Int, second: Int) -> Bool in return first<second})
    
    for num in orderedNums {
        print(num)
    }
    
// 2. Trailing Closure 
    let orderedNums2: [Int] = nums.sorted() {(first: Int, second: Int) -> Bool in return first>second} //메서드 소괄호 생략가능
     
    for num in orderedNums2 {
        print(num)
    }
    
// 3. 클로저 표현 간소화
    
    // 3.1 문맥을 이용한 타입 유추
    
        // 매서드의 전달인자로 클로저를 사용하는 경우 : 클로저는 메서드에서 요구하는 형태로 전달되어야 한다.
        
        // 즉, 매서드에서 매개변수 타입, 개수, 반환 타입이 같아야 전달인자로 사용 가능하다.
        
        // 그러므로 매개변수의 타입이나, 반환 값의 타입을 명시하지 않아도 문제가 되지 않는다.
        
        let orderedNums3: [Int] = nums.sorted {(first, second) in return first>second}
    
    //3.2 단축 인자 이름
    
        // 메서드에서 어떤 클로저가 전달인자로 들어올지 알기 때문에 단축 인자를 사용 가능하다. in 도 생략가능
        
        let orderedNums4: [Int] = nums.sorted() { return $0>$1 }
    
    //3.3 암시적 반환 표현
    
        // 단! 클로저가 반환 값을 갖는 클로저이고 클로저 내부의 실행문이 단 한 줄일때만 사용!
    
        let orderedNums5: [Int] = nums.sorted(by: {$0>$1})
    
    //3.4 연산자 함수
    
        // 연산자는 함수의 일종! 함수는 클로저의 일종 연산자는 곧 클로저가 될 수 있다.
        
        let orderedNums6: [Int] = nums.sorted(by: >)
        
        
// 4. 클로저의 값 획득 (Capture)

    // 클로저는 자신이 정의된 위치의 주변 문맥을 통해 상수나 변수를 획득 (Capture) 할 수 있다.
    
    // 중첩 함수도 하나의 클로저 형태, 자신을 포함하는 함수의 지역변수나 지역상수를 획득 할 수 있다.
    
    // 예시
    
        func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
            var runningTotal = 0
            // 중첩 함수 incrementer() 은 주변 runningTotal과 amount를 획득후 클로저로서 반환된다.
            func incrementer() -> Int {
                runningTotal += amount
                return runningTotal
            }
            
            return incrementer
        }
        
        // makeIncrementer의 반환 타입은 ()-> Int 인 함수 객체이다. 반환 함수는 매개 변수가 없고 호출 시 Int 값을 리턴한다.
        
        // incrementer 가 호출될 때 마다 runningTotal 에 amount 가 더해진다.
        
        let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)
        let first = incrementByTwo()
        let second = incrementByTwo()
        let third = incrementByTwo()
        
        print(first)
        print(second)
        print(third)
        
        // 각각의 increment 함수는 언제 호출이 되더라도 자신만의 runningTotal 변수를 가지고 카운트 하게 된다.
        
        // 클로저와 함수는 참조 타입으로 다른 변수에 참조를 할당하면 동일한 클로저를 가리키게 된다.
        
        let incrementByTen: (() -> Int) = makeIncrementer(forIncrement: 10)
    
        let ten: Int = incrementByTen()
        let twenty: Int = incrementByTen()
        let thirty: Int = incrementByTen()
        
        // 참조 할당 후
        
        let incrementByTen2: (() -> Int) = incrementByTen
        
        let fourty: Int = incrementByTen2()
        
        print(ten)
        print(twenty)
        print(thirty)
        print(fourty) // 10 20 30 40
        
