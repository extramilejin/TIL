// 2021.01.09 extramilejin

// Protocol

// 특정 역할을 수행하기 위한 메서드, 프로퍼티, 기타 요구사항등의 청사진을 정의한다.

// 구조체, 클래스, 열거형은 특정 프로토콜을 채택 (Adopted) 해서 프로토콜의 요구사항을 실제 구현한다.

// 어떤 프로토콜의 요구 사항을 모두 따르는 타입에게 그 프로토콜을 준수한다 (conform) 고 표현합니다.

// 프로토콜은 기능을 정의하고 제시만 할 뿐 구현은 하지않는다

import Swift

// 1. protocol 의 기본 형태

    protocol Talkable {
        
        var topic: String { get set }
        
        var language: String { get }
        
        func talk()
        
        init(topic: String, language: String)
        
    }
// 2.  protocol adopt and conform
    
    struct Person: Talkable {
        
        var topic: String
        
        var language: String
        
        func talk() {
            print("\(topic)에 대해 \(language)로 말합니다.")
        }
        
        init(topic: String, language: String) {
            self.topic = topic
            self.language = language
        }
    }
    
    var extramilejin: Person = Person(topic: "swift",language: "korean")
    
    extramilejin.talk()
    
    
// 3. protocol inheritance

    // 프로토콜은 클래스와 다르게 다중 상속이 가능하다.
    
    protocol Readable {
        func read()
    }
    
    protocol Writeable {
        func write()
    }
    
    protocol ReadWriteable: Readable, Writeable {
        func speak()
    }
    
    // 클래스에서 상속과 프로토콜 채택을 동시에 하려면 상속 받으려는 클래스를 먼저 명시한다.
    
    class SuperClass: Readable {
        func read() {print("읽는다")}
    }
    
    class SubClass: SuperClass, Writeable {
        func write() {print("쓴다")}
    }
    
    // 프로토콜 준수 (conform) 확인은 is, as 연산자를 사용해서 확인한다.
    
    let sup: SuperClass = SuperClass()
    
    let sub: SubClass = SubClass()
    
    var someAny: Any = sup
    
    print(someAny is Readable)
    print(someAny is Writeable)
    
    if let someReadable: Readable = someAny as? Readable {
        someReadable.read()
    }
    
    if let someWritealbe: Writeable = someAny as? Writeable {
        someWritealbe.write()               // 동작하지 않는다.
    }
   
