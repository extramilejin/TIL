import Swift

print("######################################")
print("1. 명명법/ 콘솔로그 /문자열 보간법")

// 기본 데이터 타입
var someInt: Int = -100
var someUInt: UInt = 10
var someString: String = "someString"
var someBool: Bool = false
var someDouble: Double = 10.0
var someFloat: Float = 1.23
var someCharacter: Character = "K"

// Lower Camel Case: fucntion, method, variable, constant 4 가지
// Upper Camel Case: type (class, struct, enum, extension ...)
let age: Int = 20

print("안녕하세요! 저는 \(age+8)살 입니다.")

class Person {
    var name: String = "extramilejin"
    var age: Int = 28
}

let extramilejin: Person = Person()
print("print : ")
print(extramilejin)
print("dump : ")
dump(extramilejin)
