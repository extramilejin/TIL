// 2021.02.13 extramilejin

import Foundation

func solution(_ n:Int) -> Int 
{
    var answer = 0
    var num = n
    while num != 0 {
        answer += num % 2 
        num /= 2
    }
    return answer
}
