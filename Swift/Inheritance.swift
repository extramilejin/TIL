// 2021.01.07 extramilejin

// Inheritance

import Swift

// 1. Inheritance 상속 


    // 어떤 클래스로 부터 상속을 받으면 상속 받은 클래스는 자식 클래스가 됩니다.
    
    // 자식 클래스에게 자신의 특성을 물려준 클래스를 부모 클래스라고 표현합니다.
    
    // 클래스, 메서드, 프로퍼티, 서브스크립트를 상속 받고 재정의 할 수 있습니다.
    
    
    
// 2. 기본적인 상속

    class Person {
        // 저장 프로퍼티
        var name: String = "unknown"
        
        // 자식클래스에서 재정의 하지 못하게 할 떄 final 키워드를 사용한다.
        
        final var age: Int = 0 {
        
            //프로퍼티 감시자
            
            didSet {
                print("Person age: \(age)")
            }
        }
        var koreanAge: Int {
            return self.age + 1
        }
        
        // 읽기 전용 연산 프로퍼티
        var introducing: String {
            return "이름: \(name), 나이: \(age) "
        }
        
        func speaking() -> Void {
            print("나는 사람입니다.")
        }
        
        class func introduceClass() -> Void {
            print("인류는 끊임없이 진리를 추구합니다.")
        }
    }
    
    class Student: Person {
        var grade: String = "A+"
        
        override var introducing: String {
            return super.introducing+", 점수:\(self.grade)"
        }
        
        override var koreanAge: Int {
        
            //연산 프로퍼티 재정의 : 읽기 전용에서 -> 읽기 쓰기
            
            get{
                return super.koreanAge
            }
            
            set{ 
                self.age = newValue - 1     //newValue 
            }
        }
        
        func studying() -> Void {
            print("공부는 언제나 재밌습니다.")
        }
        
        override func speaking() -> Void {
            print("저는 학생입니다.")
        }

    }
    
    var extramilejin: Student = Student()
    
    extramilejin.name = "extramilejin"
    extramilejin.koreanAge = 28         // Person age: 27
    extramilejin.speaking()             // 저는 학생입니다.
    extramilejin.studying()             // 공부는 언제나 재밌습니다.
    print(extramilejin.introducing)     // 이름: extramilejin, 나이: 27 , 점수:A+
    Person.introduceClass()             // 인류는 끊임없이 진리를 추구합니다.
    
    
// 3. 서브스크립트 상속 및 재정의

    class School {
        
        var students: [Student] = [Student]()
        
        subscript (number: Int) -> Student {
            print("School subscript")
            return self.students[number]
        }
        
    }
    
    class MiddleSchool: School {
        var middleStudents: [Student] = [Student]()
        
        //부모 서브스크립트와 매개변수와 반환타입이 같을 때 override 키워드 사용
        
        override subscript (number: Int) -> Student { 
            print("MiddleSchool subscript")
            return self.middleStudents[number]
        }
    }
    
    var hankook: MiddleSchool = MiddleSchool()
    
    hankook.middleStudents.append(extramilejin)
    print(hankook[0])   // MiddleSchool subscript
                        // Main.Student
                        
    
// 4. 클래스에서의 이니셜라이저, 지정 이니셜라이저, 편의 이니셜라이저

    class Car {
        var carName: String
        var price: Int
        
        init(carName: String, price: Int) {
            self.carName = carName
            self.price = price
        }
        
        convenience init(carName: String) {
            self.init(carName: carName, price: 0)
        }
    }
    
    class Bently: Car {
        var gt: Bool
        
        override init(carName: String, price: Int) {
            self.gt = true
            super.init(carName: carName, price: price)
        }
        
        convenience init(carName: String) {
            self.init(carName: carName, price: 100000)
        }
    }
    
    var continental: Bently = Bently(carName: "continentalGt")
    print(continental.price)        //100000
   
