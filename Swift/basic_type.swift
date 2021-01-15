import Swift

// 기본 데이터 타입

//Int : 정수타입으로 기본적으로 64비트 정수형
//UInt : 양의 정수타입 , 64비트 양의 정수형

var someInt: Int = -100
var someUInt: UInt = 10



// String : 문자열 타입, 유니코드 사용, 큰 따옴표("") 사용
// Character : 문자 타입, 유니코드 사용, 큰따옴표("") 사용

var someString: String = "someString"
var someCharacter: Character = "K"



// Bool : true 와 false만을 값으로 가지는 타입, C 나 C ++ 처럼 0,1의 값으로 대체할 수 없다.

var someBool: Bool = false



//Float : 실수 타입, 32비트 부동소수형
//Double : 실수 타입, 64비트 부동소수형

var someDouble: Double = 10.0
var someFloat: Float = 1.23


// 만약 데이터 타입을 명시 하지 않고 선언하면 어떻게 될까?

let integer = 28
let floating = 123.45
let myName = "extramilejin"

print(type(of: integer))
print(type(of: floating))
print(type(of: myName))

// 순서대로 Int , Double , String 이 된다. Swift 의 Type Inference에 따른 당연한 결과이다.




