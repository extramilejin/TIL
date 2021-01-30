// 2021.01.31 extramilejin

import Foundation

func solution(_ s:String) -> [Int] {
    var str = s
    var binaryTranslation = 0
    var countOfRemovedZeros = 0
    while str != "1" {
        countOfRemovedZeros += str.filter{$0 == "0"}.count
        str = String(str.filter{$0 == "1"}.count, radix: 2)
        binaryTranslation += 1
    }
    return [binaryTranslation, countOfRemovedZeros]
}