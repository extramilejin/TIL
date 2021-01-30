// 2021.01.30 extramilejin

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let b = Double(brown)
    let y = Double(yellow)
    let upper = -(b + 4) + sqrt(pow(b + 4, 2) - 16 * (y + b))
    let lower = 4
    var h = abs(Int(upper)/Int(lower))
    var w = Int(y + b) / h
    return [w,h]
}

