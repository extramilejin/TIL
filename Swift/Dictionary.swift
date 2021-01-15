//2021.01.04 extramilejin

//Collection Types (Array, Dictionary, Set)

//Array: 순서가 있는 리스트 컬렉션
//Dictionary: "key" 와 "value" 의 쌍으로 이루어진 컬렉션
//Set: 순서가 없고, 멤버가 유일한 컬렉션

import Swift

//Dictionary

//1. 선언

    var anyDictionary: Dictionary<String, Any> = [String: Any]()
    
    //동일 표현
    // var anyDictionary: Dictionary<String, Any> = Dictionary<String, Any>()
    // var anyDictionary: Dictionary<String, Any> = [:]
    // var anyDictionary: [String: Any] = Dictionary<String, Any>()
    // var anyDictionary: [string: Any] = [String: Any]()
    // var anyDictionary: [string: Any] = [:]
    // var anyDictionary = [String: Any]()

//2. method

    //키에 해당하는 값을 할당
    
    anyDictionary["age"] = 28
    anyDictionary["name"] = "extramilejin"
    
    print(anyDictionary) //["age": 28, "name": "extramilejin"]
    
    // removeValue or nil
    
    anyDictionary.removeValue(forKey: "age")
    anyDictionary["name"] = nil
    
    print(anyDictionary) // empty Dictionary -> [:]


//3. constant Dictionary

    let emptyDictionary: [String: String] = [:]
    let intializedDictionary: [String: String] = ["name": "extramilejin", "age": "28"]
    
    //값 변경 불가능
    
    //let someValue: String = intializedDictionary["name"]  -> 컴파일 오류 : 키에 해당하는 값이 없을 수 있다.

