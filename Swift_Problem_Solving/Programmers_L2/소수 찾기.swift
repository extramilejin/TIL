// 2021.01.28 extramilejin

import Foundation

var checkedNumbers = Array(repeating: false, count: 7)
var pickedNumbers: Array<Character> = []
var primes: Set<Int> = Set<Int>()

func isPrime (_ number: Int) -> Bool {
    guard number >= 2 else {
        return false
    }
    
    let standard = Int(sqrt(Double(number))) + 1
    for i in 2..<standard {
        if number % i == 0 {
            return false
        }
    }
    return true
}

func dfs(_ count: Int, _ target: Int, _ str: String) -> Void {
    if count == target {
        if isPrime(Int(String(pickedNumbers))!) {
            primes.insert(Int(String(pickedNumbers))!)
        }
        return 
    } 
    
    for i in 0..<str.count {
        var index = str.index(str.startIndex, offsetBy: i)
        if checkedNumbers[i] {continue}
        checkedNumbers[i] = true
        pickedNumbers.append(str[index])
        dfs(count + 1, target, str)
        pickedNumbers.removeLast()
        checkedNumbers[i] = false
    }
}

func solution(_ numbers: String) -> Int {
    for i in 1...numbers.count {
        dfs(0, i, numbers)
    }
    return primes.count
}