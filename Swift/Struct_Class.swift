// 2021.01.04 extramilejin

// Struct vs Class in Swift

import Swift

// Struct : 구조체

    // 구조체는 값(Value) 타입 입니다.

    // 1. 정의의 기본 형태
    
        // sturct 이름 { }
        
        struct Student {
            
            //가변 프로퍼티 : 프로퍼티 -> 타입안의 인스턴스 변수를 뜻한다.
            
            var name: String = "unknown"
            
            var `class`: String = "Swift"            // keyword 인 class를 사용하기 위해 ` `로 묶어준다. ' ' 작은 따옴표가 아니다.
            
            //불변 프로퍼티 : 가변 인스턴스일 경우에도 값 변경이 불가능 하다.
            
            let success: Bool = true
            
            // 타입 프로퍼티 :  타입이 사용하는 프로퍼티
            
            static let study: Bool = true
            
            // 인스턴스 메서드 : 인스턴스가 사용하는 메서드
            
            func selfIntroduce(){
                print("저는 \(self.class)를 공부하는 \(self.name)입니다.")
            }
            
            // 타입 메서드 : 타입 자체가 사용하는 메서드 
            
            static func selfIntroduce() -> Void {
                print("학생 타입 입니다.")
            }
        }
       
      
    
    // 2. 인스턴스 생성 및 사용
    
        var extramilejin: Student = Student()
        
        extramilejin.name = "extramilejin"
        extramilejin.class = "스위프트"
        extramilejin.selfIntroduce()
        
        let gildong: Student = Student()
        
        // gildong.name = "gildong" 불변 인스턴스의 프로퍼티 값 변경 불가.
        
        //타입 메서드와 타입 프로퍼티
        
        Student.selfIntroduce()
        print(Student.study)
    
    
    
// Class : 클래스

    // 클래스는 참조 타입이다.
    
    // Swift의 클래스는 다중 상속이 불가능 하다.
    
    // 1. 정의의 기본 형태
        
        //class 이름 { }
        
        class Car {
        
            // 가변 프로퍼티
            
            var name: String = "unknown"
            
            // 불변 프로퍼티
            
            let hasWheels: Bool = true
            
            // 타입 프로퍼티
            
            static let typeProperty: String = "Car"
            
            // 인스턴스 메서드
            
            func selfIntroduce(){
                print("이 차는 \(self.name) 입니다.")
            }
            
            // 재정의 불가 타입 메서드
            
            static func color() -> Void {
                print("Yellow")
            }
            
            // 재정의 가능 타입 메서드
            
            class func color2() -> Void {
                print("Green")
            }
            
        }
    
    // 2. 인스턴스 생성 및 사용
    
        var bmw: Car = Car()
        
        bmw.name = "bmw"
        
        bmw.selfIntroduce()
        
        print(Car.typeProperty)
        
        Car.color()
    
    
// 결론 : stuct vs class 

    // stuct 값 타입 , class 참조 타입
    
    // class 에서 let으로 선언한 불변 인스턴스의 가변 프로퍼티 값을 변경 가능하다.
    
    // struct 에서는 불가능.

// 값 타입 vs 참조 타입

   // 값 타입 : 값을 복사하여 전달한다. 구조체는 값 타입
    
    struct ValueType {
        var property: Int = 1
    }
    
    var firstInstance = ValueType()
    var secondInstance = firstInstance
    secondInstance.property = 2
    
    print("first: \(firstInstance.property), second: \(secondInstance.property)") // first: 1, second: 2
    
    // 참조 타입 : 메모리 위치를 전달한다. 클래스는 참조 타입
      
    class ReferenceType {
        var property: Int = 1
    }
    
    var thirdInstance = ReferenceType()
    var fourthInstance = thirdInstance
    fourthInstance.property = 2
    
    print("third: \(thirdInstance.property), fourth: \(fourthInstance.property)") // third: 2, fourth: 2



