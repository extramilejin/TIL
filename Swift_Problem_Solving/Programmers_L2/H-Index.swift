// 2021.01.30 extramilejin

import Foundation

func solution(_ citations:[Int]) -> Int {
    for h in (0..<citations.count + 1).reversed() {
        if citations.filter{$0 >= h}.count >= h {
            return h
        }
    }
    return 0
}