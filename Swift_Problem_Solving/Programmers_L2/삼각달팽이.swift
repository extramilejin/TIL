// 2021.01.27 extramilejin

import Foundation

func solution(_ n:Int) -> [Int] {
    let MAX = 1000
    let dPos = [(1, 0), (0, 1), (-1, -1)]
    var answer: [Int] = []
    var sizeOfN = n
    var dir = 0
    var dirChange = 2
    var map = Array(repeating: Array(repeating: 0, count: MAX), count: MAX)
    var curPos = (0, 0)
    var snailNum = 1
    var cnt = n - 1
    if cnt == 0 {
        map[curPos.0][curPos.1] = snailNum
    }
    else {
        while map[curPos.0][curPos.1] == 0 {
            map[curPos.0][curPos.1] = snailNum
            curPos.0 += dPos[dir].0
            curPos.1 += dPos[dir].1
            cnt -= 1
            if cnt == 0 {
                dir = (dir + 1) % 3
                dirChange -= 1
                if dirChange <= 0 {sizeOfN -= 1}
                cnt = sizeOfN - 1
            }
            snailNum += 1
        }
    }
    for i in 0..<n {
        for j in 0...i {
            answer.append(map[i][j])
        }
    }
    return answer
}