// 2021.01.08 extramilejin

// Type Casting

import Swift

// 1. Type Casting 
    
    // Swift의 타입 캐스팅 인스턴스의 타입을 확인 하는 용도 is
    
    // 클래스의 인스턴스를 부모 (업 캐스팅) 자식 클래스 (다운 캐스팅)으로 사용할 수 있는지 확인
    
    // 형 변환 let someDouble = Double(2) 은 타입 캐스팅이아니라 새로운 값 생성이다.
    
    class Person {
        var name: String = "unknown"
        func eat(){
            print("밥을 먹습니다.")
        }
    }
    
    class Student: Person {
        var school: String = "unknown"
        func goToSchool() {
            print("등교를 합니다")
        }
    }
    
    class UniversityStudent: Student {
        var major: String = "computer science"
        
        func goToMT() -> Void {
            print("MT 간다!")
        }
    }
    
    var joro: Person = Person()
    var sangdi: Student = Student()
    var lupi: UniversityStudent = UniversityStudent()
    
    var result: Bool
    
    result = lupi is Person
    print(result)
    
    result = joro is UniversityStudent
    print(result)


//2.  Up Casting 
    
    // as를 사용하여 부모 클래스의 인스턴스로 사용 할 수 있도록 타입 정보를 전달한다.
        
    // Any 혹은 AnyObject로도 타입정보를 변환 할 수 있다.
    
    // 암시적르오 처리되므로 생략이 가능하다. as Person
    
    var bugi: Person = UniversityStudent() as Person
    
    var nami: Any = Person() // Any로 업캐스팅해도 문제가 되지 않는다.
    
    
//3. Down Casting 

    // 조건부 다운캐스팅 as?
    
    // 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 nil을 반환한다. 즉 옵셔널 타입을 반환한다.
    
    var optionalCasted: Student?
    
    optionalCasted = lupi as? UniversityStudent
        
    print(optionalCasted)   // Optional(Main.UniversityStudent)
    
    optionalCasted = sangdi as? UniversityStudent // sangdi는 Student
    
    print(optionalCasted)   //nil
    
    // 강제 다운 캐스팅 as!
    
    // 캐스팅에 실패하면 런타임오류가 발생한다. 캐스팅에 성공하면 옵셔널이 아닌 일반타입을 반환한다.
        
    var ace: Person = UniversityStudent() as Person // Up Casting
    
    var forcedCasted: UniversityStudent  = ace as! UniversityStudent // Down Casting
    
    forcedCasted.goToMT()   //MT 간다.
    
    
    
    
    

        
    
