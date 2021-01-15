// 2021.01.07 extramilejin

// Subscript

import Swift

// 1. Subscript 서브 스크립트 아래 첨자.


    // 클래스, 구조체, 컬렉션, 리스트, 시퀀스 등 타입의 요소에 접근하는 단축 문법을 뜻한다.
    
    // 클래스와 구조체는 필요한 만큼 얼마든지 서브스크립트를 구현할 수 있습니다. 
    
    // 한 타입에 여러 서브크립트를 구현하는 것을 서브스크립트 중복 정의라고 합니다.
    
    // 서브스크립트는 매서드 , 연산 프로퍼티 인듯 아닌듯 중간 형태를 띕니다.
    
    // 서브스크립트는 여러 매개변수를 가질 수 있으며, 매개 변수 기본값을 가질 수 있습니다.
    
    
    
// 2. 인스턴스 서브스크립트 구현

    struct Student {
        
        var name: String
        
        var number: Int
        
    }
    
    class School {
        
        var number: Int = 0
        
        var students: [Student] = [Student]()
        
        func addStudent(name: String) {
            
            let student: Student = Student(name: name, number: self.number)
            
            students.append(student)
            
            self.number += 1
        }
        
        func addStudent(names: String...){
            
            for name in names{
            
                self.addStudent(name: name)
                
            }
            
        }
        
        // 읽기 전용 서브스크립트
        
        // subscript(index: Int = 0) -> Student? {
            
        //     if index < self.number {
            
        //         return self.students[index]
                
        //     }
            
        //     return nil
            
        // }
        
        
        // 읽기, 쓰기 서브스크립트
        
         subscript(index: Int = 0) -> Student? {
            
            get {
                if index < self.number {
                    return self.students[index]
                }
                return nil
            }
            
            set {
                guard var newStudent: Student = newValue else {
                    return
                }
                
                var number: Int = index
                
                if index > self.number {
                    number = self.number
                    self.number += 1
                }
                
                newStudent.number = number
                self.students[number] = newStudent
            }
        }
        
        // 서브스크립트 중복 정의
        
        subscript(name: String) -> Int? {
            get {
                return self.students.filter{ $0.name == name }.first?.number
            }
            
            set {
                guard var number: Int = newValue else {  // 암시적 전달인자 newValue
                    return
                }
                
                if number > self.number {
                    number = self.number
                    self.number += 1
                }
                
                let newStudent: Student = Student(name: name, number: self.number)
            
                self.students[number] = newStudent
            
            }
            
        }
        
        // 읽기 전용 매개변수를 여러개 갖는 서브스크립트.
        
        subscript(name: String, number: Int) -> Student? {
            return self.students.filter{ $0.name == name && $0.number == number }.first
        }
    
    }
    
    let highSchool: School = School()
    
    highSchool.addStudent(names: "Sung-Kyu","Jin-Han","Sung-Ho","Kyeong-Tae","Hyeon-Suk")
    
    let aStudent: Student? = highSchool[1]
    
    highSchool[4] = Student(name: "extramilejin", number: 5)
    
    let bStudent: Student? = highSchool[4]
    
    print("\(aStudent?.name) : \(aStudent?.number)")
    
    print("\(bStudent?.name)")
    
    print("\(highSchool["Jin-Han"])") // Optional(1)
    
    print("\(highSchool["Sang-Hoon"])") // nil
    
    print("\(highSchool["Sung-Ho",2])") // Optional(Main.Student(name: "Sung-Ho", number: 2))
    
    
    
// 3. 타입 서브스크립트 구현
   
   // 타입 자체에서 사용 가능한 서브스크립트
   
   // 선언 시 구조체, 열거형 등 값 타입에서는 static 키워드를 앞에 붙이고, 클래스의 경우 class 키워드를 앞에 붙힌다.
   
   // 타입 서브스크립트 구현
   
   enum School2: Int {
       case elemantary = 1, middle, high, university
       
       static subscript(level: Int) -> School2? {
           return School2(rawValue: level) // return Self(rawValue: level)도 같은 표현
       }
   }
   
   let someSchool: School2? = School2[2]
   
   print(someSchool)  // Optional(Main.School2.middle)
   
