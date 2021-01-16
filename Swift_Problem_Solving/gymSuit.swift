// 2021.01.16 extramilejin
// problem link: https://programmers.co.kr/learn/courses/30/lessons/42862?language=swift
t
import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    var newLost: [Int] = lost
    var newReserve: [Int] = reserve
    var answer: Int = n - lost.count
    print(answer)
    var count: Int = 0
    
    for (i,numI) in newLost.enumerated() {
        for (j,numJ) in newReserve.enumerated() {
            if numI == numJ {
                newLost[i] = -1
                newReserve[j] = -1
                count += 1
                break
            }
        }
    }
    
    for (i,numI) in newLost.enumerated() {
        for (j,numJ) in newReserve.enumerated() {
           if(numJ == numI - 1 || numJ == numI + 1) {
               newReserve[j] = -1
               count += 1
               break
           }
        }
    }
    
    answer += count
    
    return answer
}
