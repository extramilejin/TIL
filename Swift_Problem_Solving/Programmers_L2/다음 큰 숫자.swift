// 2021.01.31 extramilejin

import Foundation

func solution(_ n:Int) -> Int
{
    var answer = n + 1
    var cnt = String(n, radix: 2).filter{$0 == "1"}.count
    while String(answer, radix: 2).filter{$0 == "1"}.count != cnt {
        answer += 1
    } 
    return answer
}