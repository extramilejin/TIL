//2021.01.04

//Collection Type (Array, Dictionary, Set)

//Array: 순서가 있는 리스트 컬렉션
//Dictionary: "key" 와 "value" 의 쌍으로 이루어진 컬렉션
//Set: 순서가 없고, 멤버가 유일한 컬렉션

import Swift

//Array 

//1. 선언

var numbers: Array<Int> = Array<Int>()

// 동일 표현
// var numbers: Array<Int> = [Int]()
// var numbers: Array<Int> = []
// var numbers: [Int] = [Int]()
// var numbers: [Int] = Array<Int>()
// var numbers: [Int] = []
// var numbers = [Int]()

//2. method

//append 

numbers.append(1)
numbers.append(28)
print(numbers) // [1, 28]

//contains

print(numbers.contains(28)) // return true or false
print(numbers.contains(30))

//remove
numbers.remove(at: 0) // 0번째 원소 삭제
numbers.removeLast() //마지막 원소 삭제
numbers.removeAll() //모든 원소 삭제

//count
print(numbers.count)

//access with index

numbers.append(28)
numbers[0] = 1
print(numbers[0])

//3. constant Array

let constArray = [1, 2, 3]

//append , remove 불가능

