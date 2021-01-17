//2021.01.15 extramilejin
//Problem Link: https://programmers.co.kr/learn/courses/30/lessons/42748

//단순 구현, 정렬

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer: [Int] = [Int]()
    for command in commands {
        var resultArray: [Int] = [Int]()
        for index in command[0]-1...command[1]-1 {
            resultArray.append(array[index])
        }
        resultArray.sort(by: <)
        answer.append(resultArray[command[2]-1])
    }
    return answer
}
