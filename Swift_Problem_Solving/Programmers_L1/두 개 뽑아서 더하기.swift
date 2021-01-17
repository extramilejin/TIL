//2021.01.15 extramilejin
//problem link: https://programmers.co.kr/learn/courses/30/lessons/68644

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var arr: [Int] = [Int]()
    var visited: [Bool] = Array(repeating: false, count: 201)
    for (i,numi) in numbers.enumerated() {
        for (j,numj) in numbers.enumerated(){
            if i != j && visited[numi+numj] == false {      //중복 방지
               visited[numi+numj] = true
            }
        }
    }
    
    for i in 0..<201 {
        if visited[i] == true {arr.append(i)}
    }
    return arr.sorted(by: <)
}
