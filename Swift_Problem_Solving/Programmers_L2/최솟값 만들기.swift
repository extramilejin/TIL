// 2021.01.31 extramilejin

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{   
    var answer = 0
    var sortedA = A.sorted(by: <)
    var sortedB = B.sorted(by: >)
    for i in 0..<A.count {
        answer += sortedA[i] * sortedB[i]
    }
    return answer
}