// 2021.01.28 extramilejin

import Foundation

func compareTwoString (_ a: String, _ b: String) -> Bool {
    return Int(a + b)! > Int(b + a)!
}

func solution(_ numbers:[Int]) -> String {
    var answer = numbers.map{String($0)}.sorted(by: compareTwoString).reduce(""){$0 + $1}
    return answer.first! == "0" ? "0" : answer
}