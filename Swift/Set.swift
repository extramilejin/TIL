// 2021.01.04 extramilejin

// Collection Type (Array, Dictionary, Set)

// Array: 순서가 있는 리스트 컬렉션
// Dictionary: "key" 와 "value" 의 쌍으로 이루어진 컬렉션
// Set: 순서가 없고, 멤버가 유일한 컬렉션

import Swift

// Set

//1. 선언

   var numberSet: Set<Int> = Set<Int>()
    
    // 동일 표현이 존재하지 않는다.

//2. method

    // insert
    
    numberSet.insert(1)
    numberSet.insert(28)
    numberSet.insert(28)
    numberSet.insert(2021)
    
    print(numberSet) //{2021,28,1} 순서가 존재하지 않으며 멤버는 유일.
    
    // contains
    
    print(numberSet.contains(28))  // true
    print(numberSet.contains(2020))// false
    
    // remove
    
    numberSet.remove(1)     // 해당 원소를 삭제
    numberSet.removeFirst() // 혹시나 정렬 했을 수도 있기 때문에 First라는 표현이 존재하는 듯.. 원래는 not ordered collection이다.
    
    // count
    
    print(numberSet.count)


// 3. Union , sort , intersection, subtracting

    let setA: Set<Int> = [1,2,3,4,5]
    let setB: Set<Int> = [2,4,6,8,10]
    
    // Union
    
    let unionSet: Set<Int> = setA.union(setB)
    print(unionSet)
    
    // sort
    
    let sortedSet: Array<Int> = unionSet.sorted() // sorting 하면 Array가 된다.
    print(sortedSet)
    
    // intersection : 교집합
    
    let intersectionSet: Set<Int> = setA.intersection(setB)
    print(intersectionSet)
    
    // subtracting : 차집합
    
    let subtractingSet: Set<Int> = setA.subtracting(setB)
    print(subtractingSet)

