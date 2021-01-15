// 2021.01.08 extramilejin

// Instance Initializer / deinitializer

import Swift

// 1. Inatance 
        
    // 인스턴스를 생성하는 이니셜라이저, 클래스의 인스턴스가 소멸될 떄 호출되는 디이니셜라이저
    
    // Swift의 모든 인스턴스는 초기화와 동시에 모든 프로퍼티에 유효한 값이 할당되어야 있어야한다.
    
    // 프로퍼티에 미리 기본값을 할당하면 인스턴스 생성과 동시에 초기값을 지니게 된다.
    
    class Person {
        
        var name: String = "unknown"    // 기본값을 정하지 않아도 이니셜라이저를 통해 초기값 전달 가능
        var age: Int 
        var hobby: String
        var nickName: String?           //프로퍼티의 초기값이 꼭 필요 없을 때 옵셔널 사용.
        
        init(name: String, age: Int, hobby: String) {
            self.name = name
            self.age = age
            self.hobby = hobby
        }
        
        convenience init(name: String, age: Int, hobby: String, nickName: String) {
            self.init(name: name, age: age, hobby: hobby)
            self.nickName = nickName
        }
    }
    
    var extramilejin: Person = Person(name: "extramilejin", age: 28, hobby: "swift")
    var travis: Person = Person(name: "travis", age: 30, hobby: "sickomode", nickName: "webster")
    
    print(extramilejin.name)    // nil
    
    
    
// 2. 프로퍼티의 암시적 추출 옵셔널

    // 메서드의 사용에 꼭 필요하지만 이니셜라이저에서 초기값을 할당하지 않고자 할 때 사용한다.
    
    class Puppy {
        
        var name: String
        
        var owner: Person!
        
        init(name: String) {
        
            self.name = name
            
        }
        
        func goOut() {
            print("\(name)가 주인 \(owner.name)과 함께 산책을 합니다.")
        }
        
    }
    
    let italianGrayhound: Puppy = Puppy(name: "italianGrayhound")
    
    //italianGrayhound.goOut() 오류 발생
    
    italianGrayhound.owner = extramilejin
    
    italianGrayhound.goOut()    // italianGrayhound가 주인 extramilejin과 함께 산책을 합니다.
    

    
// 3. 실패가능한 이니셜라이저

    // 이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우 인스턴스 생성에 실패 가능하다.
    
    // 인스턴스 생성에 실패하면 nil 을 반환한다. 
    
    // 실패가능한 이니셜라이저의 반환타입은 옵셔널 타입이다.
    
    class PersonD {
        
        var name: String
        
        var age: Int
        
        var nickName: String?
        
        init?(name: String, age: Int) {
            if(0...120).contains(age) == false {
                return nil
            }
            
            if name.count == 0 {
                return nil
            }
            
            self.name = name
            self.age = age
        }
    }
    
    let superman: PersonD? = PersonD(name: "superman", age: 125)  
    let aquaman: PersonD? = PersonD(name: "aquaman", age: 29)
    
    print(superman) // nil
    print(aquaman)  // Optianl 타입
    
    
// 4. 디이니셜라이저

    // deinit은 클래스의 인스턴스가 메모리에서 해제되는 시점에 호출된다. 
    
    // ARC의 규칙에 따라 자동으로 호출된다.
    
    // 클래스타입에만 구현 할 수 있다. 인스턴스가 해제되는 시점에 해야할 코드를 작성한다.
    
    class DogOwner: Person {
        var child: Person
        var pet: Puppy?
        
        init(name: String, age: Int, hobby: String, child: Person) {
            self.child = child
            super.init(name: name, age: age, hobby: hobby)
        }
        
        deinit{
            
            if let petName = pet?.name {
                print("\(name)이 \(child.name)에게 \(petName)를 인도합니다.")
                self.pet?.owner = child
            }
        }
    }
    
    var dean: DogOwner? = DogOwner(name: "dean", age: 30, hobby: "singing", child: Person(name: "miso", age: 24, hobby: "sing"))
    
    dean?.pet = Puppy(name: "IG")
    
    dean = nil  // dean이 miso에게 IG를 인도합니다.
    
