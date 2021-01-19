// 2021.01.19 extramilejin

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var answer = 0
    for (index,intNum) in a.enumerated() {
        answer += intNum * b[index]
    }
    return answer
}