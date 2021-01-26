// 2021.01.27 extramilejin

import Foundation

func reduceBigNumber (a: Int64, b: String) -> Int64 {
    var mod: Int64 = 0
    for digit in b {
        mod = (mod * 10 + Int64(String(digit))!) % a
    }
    return mod
}

func getGCD (_ a: Int64, _ b: Int64) -> Int64 {
    if b == 0 {return a}
    return getGCD(b, a % b)
}

func solution(_ w:Int, _ h:Int) -> Int64{
    let bigger = Int64(w > h ? w : h)
    let smaller = Int64(w < h ? w : h)
    let reducedBigger = reduceBigNumber(a: smaller, b: String(bigger))
    return bigger * smaller - (bigger + smaller - getGCD(reducedBigger, smaller))
}