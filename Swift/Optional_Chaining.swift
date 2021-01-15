// 2021.01.08 extramilejin

// Optional Chaining, nil operator

import Swift

// 1. Optional Chaining
        
  class Person {
      var name: String
      var job: String?
      var home: Apartment?
      
      init(name: String) {
          self.name = name
      }
  }
  
  class Apartment {
      var buildingNumber: String
      var roomNumber: String
      var `guard`: Person?
      var owner: Person?
      
      init(dong: String, ho: String) {
          buildingNumber = dong
          roomNumber = ho
      }
}

let extramilejin: Person? = Person(name: "extramilejin")
let apart: Apartment? = Apartment(dong: "121",ho: "708")
let superman: Person? = Person(name: "superman")

func guardWithOptionalChaining(owner: Person?) {
    if let guardName = owner?.home?.guard?.name {
        print("우리집 경비원의 이름은 \(guardName)입니다.")
    } else {
        print("우리집에는 경비원이 없습니다.")
    }
}

guardWithOptionalChaining(owner: extramilejin)

extramilejin?.home = apart

extramilejin?.home?.guard = superman

guardWithOptionalChaining(owner: extramilejin)

var nameOfGuard: String

nameOfGuard = extramilejin?.home?.guard?.job ?? "슈퍼맨" // nil 병합 연산자 활용 

print(nameOfGuard)

extramilejin?.home?.guard?.job = "Protector"

nameOfGuard = extramilejin?.home?.guard?.job ?? "슈퍼맨"

print(nameOfGuard)
