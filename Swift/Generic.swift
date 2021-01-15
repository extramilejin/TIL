// 2021.01.13 extramilejin

// Generic

// Generic 을 사용한 전위연산자 구현

    prefix operator **      // 연산자 정의
    
    prefix func ** <T: BinaryInteger> (value: T) -> T {
        return value * value;
    } 
    
    print(**5)  // 25
    
    let k: UInt = 13
    
    print(**k)  // 169


// Generic function

// 매개변수의 타입 앞에 inout 이 붙어있으면, 함수 내부에서 해당 매개변수 (전달 인자) 값을 변경 할 수 있다.

// 호출인자에 &기호가 붙어야한다.

    func swapTwoValue<T>(_ a: inout T, _ b: inout T) -> Void {
        let tempValue: T = a
        a = b
        b = tempValue
    }
    
    var someIntA: Int = 3
    var someIntB: Int = 5
    var someStringC: String = "extramilejin"
    var someStringD: String = "swift"
    
    swapTwoValue(&someIntA, &someIntB)
    swapTwoValue(&someStringC, &someStringD)
    
    print(someIntA)     // 5
    print(someIntB)     // 3     
    print(someStringC)  // swift
    print(someStringD)  // extramilejin

// Generic Type 

    struct Stack<Element> {
        var items: [Element] = [Element]()
        
        mutating func push(item: Element) -> Void {
            items.append(item)
        }
        
        @discardableResult mutating func pop() -> Element {
            return items.removeLast()
        }
    }
    
    var intStack: Stack<Int> = Stack<Int>()
    
    intStack.push(item: 1)  
    print(intStack.pop())   // 1

// Generic Type extension

    extension Stack {
        var topElement: Element? {
            return self.items.last
        }
    }
    
    intStack.push(item: 3)  
    print(intStack.topElement)  // Optional(3)
    
    if let topElement = intStack.topElement {
        print(topElement)
    } else {
        print("nil")
    }
    // 3
    intStack.pop()
    
    if let topElement = intStack.topElement {
        print(topElement)
    } else {
        print("nil")
    }
    // nil

// Type contraints

// 타입 제약은 클래스나 프로토콜로만 줄 수 있다.

// 타입 매개변수 뒤에 명시한다. 여러 제약 추가 시 where 절 사용

// struct Stack <Element: Hashable> {
    

// Associated Type 

// 프로토콜 정의에서 플레이스 홀더 역할을 하는 것이 연관 타입이다.

protocol Container {
    associatedtype ItemType
    var count: Int { get }
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

