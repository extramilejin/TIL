//2020.01.04

// Any , AnyObject , nil

// Any: Swift의 모든 타입을 지칭하는 키워드

var someAny: Any = 100

someAny = "extramilejin"
someAny = 123.456

// var someDouble: Double = someAny  -> 컴파일 오류


// AnyObject: 모든 클래스 타입을 지칭하는 프로토콜

class SomeClass{}
var someAnyObject: AnyObject = SomeClass()

// someAnyObject = "extramiejin" -> 컴파일 오류 , AnyObject는 클래스의 인스턴스만 수용 가능


// nil: 값이 없음을 의미하는 키워드 

//someAny = nii
//someAnyObject = nil 

// 모두 컴파일 오률가 발생한다. nil을 다루기 위해 optional을 이용해야 한다.
