// 2021.01.04 extramilejin

// Basic Functions

import Swift

// function : 함수

// 1. 선언의 기본 형태

    // func 함수 이름(매개변수1 이름: 타입, 매개변수2 이름: 타입) -> 반환타입 { }
    
   func sum(a: Int, b: Int) -> Int{
       return a + b
   }
   
   // 반환 값이 없는 경우 , -> Void 생략 가능하다.
   
   func printName(name: String) -> Void{
       print(name)
   }
   
   // 매개변수가 없는 경우
   
   func maxIntegerValue() -> Int{
       return Int.max
   }
   
   // 매개변수와 반환값이 없는 경우, 마찬가지로 Void 타입 생략 가능
   
   func sayHello() -> Void { print("Hello World!") }

// 2. 호출

    print(sum(a: 3,b: 5))
    
    printName(name: "extramilejin")
    
    print(maxIntegerValue())
    
    sayHello()
    
    
// 3. 매개변수 기본값 설정

    func sayHello(friend: String, me: String = "extramilejin") -> Void {
        print("Hello \(friend)! I'm \(me).")
    }
    
    // 매개변수 기본 값을 설정해놓으면 호출 시 생략 가능하다.
    
    sayHello(friend: "Sila")
    sayHello(friend: "Jinhan", me: "Sungho")
    
    
// 4. 전달인자 레이블 (Argument Label)

    // 함수를 호출할 때 함수 사용자의 입장에서 매개변수의 역활을 명확히 표현하고자 사용한다.
    // 동일 이름의 함수를 중복으로 생성 가능.
    
    func sayHello(to friend: String, from me: String = "extramilejin") -> Void {
        print("Hello \(friend)! I'm \(me).")
    }
    
    sayHello(to: "Kyeongtae",from: "hyeonsuk")
    sayHello(to: "Sena")
    
    
// 5. 가변 매개변수

    // 전달 받을 값의 개수를 알기 어려울 때 사용한다.
    // 가변 배개변수는 함수당 하나만 가질 수 있다.
    
    func sayHelloToFriends(me: String = "extramilejin", friends: String...) -> String {
        return "Hello! \(friends)! I'm \(me)."
    }
    
    print(sayHelloToFriends(friends: "Sungho","Sungkyu","Jirap"))
    
   // Hello! ["Sungho", "Sungkyu", "Jirap"]! I'm extramilejin.
   
  
// 6. 데이터 타입으로서의 함수

    // 스위프트는 함수형 프로그래밍 패러다임을 포함하므로 스위프트에서 함수는 일급 객체
    // 따라서 함수를 변수, 상수에 할당이 가능하고 매개변수로 전달이 가능하다.
    
    // 변수 할당
    
    var someFunction: (String, String) -> Void = sayHello(to:from:)
    
    someFunction("eric","extramilejin")
    
    someFunction = sayHello(friend:me:)  // 타입이 같아야지만 할당이 가능하다.
    
    someFunction("eric","extramilejin")
    
    // 매개변수로 전달
    
    func anotherFunction(function: (String, String) -> Void) {
        function("dog","extramilejin")
    }
    
    anotherFunction(function: sayHello(friend:me:))
    
    // Hello dog! I'm extramilejin.
