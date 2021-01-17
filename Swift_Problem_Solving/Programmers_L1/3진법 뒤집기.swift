// 2021.01.16 extramilejin

// problem link: https://programmers.co.kr/learn/courses/30/lessons/68935

import Foundation

func solution(_ n:Int) -> Int {
    var reversedTernary: [Int] = []
    var N: Int = n
    
    repeat {
        reversedTernary.append(N%3)
        N /= 3
    } while N != 0
    
    var powerOfThree: Int = 1
    var result: Int = 0
    
    reversedTernary.reverse()
    
    for mul in reversedTernary {
        result += powerOfThree * mul
        powerOfThree *= 3
    }
    
    return result
}
