// 2021.01.31 extramilejin

import Foundation

func solution(_ land:[[Int]]) -> Int{
    var answer = 0 
    var cache = [[Int]](repeating: [Int](repeating: 0, count: 4), count: land.count)
    for i in 0..<4 {cache[0][i] = land[0][i]}
    for i in 0..<land.count - 1{
        for j in 0..<4{
            for k in 0..<4 {
                if j != k && cache[i][j] + land[i+1][k] > cache[i + 1][k]{
                    cache[i + 1][k] = cache[i][j] + land[i + 1][k]
                    if answer < cache[i + 1][k] {answer = cache[i + 1][k]}
                }
            }
        }
    }
    return answer
}