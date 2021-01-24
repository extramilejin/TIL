// 2021.01.24 extramilejin

import Foundation

func pow (base: Int, ex: Int) -> Int {
    var result = 1
    for _ in 0..<ex {
        result *= base
    }
    return result
}

func solution(_ dartResult:String) -> Int {
    var totalScore = 0
    var accumulatedScore = 0
    var rightBeforeScore = 0
    var inputTen = false
    var newDartResult = dartResult.map{$0}
    for index in 0..<newDartResult.count {
        var cmpString = String(newDartResult[index])
        if cmpString == "S" || cmpString == "D" || cmpString == "T" {
            switch cmpString {
                case "S": accumulatedScore = pow(base: accumulatedScore, ex: 1)
                case "D": accumulatedScore = pow(base: accumulatedScore, ex: 2)
                case "T": accumulatedScore = pow(base: accumulatedScore, ex: 3)
                default: break
            }
        }
        else if cmpString == "*" || cmpString == "#" {
            if cmpString == "*" {
                accumulatedScore *= 2
                totalScore += rightBeforeScore
            }
            else {
                accumulatedScore *= -1
            }
        }
        else{
            if cmpString == "1" && newDartResult[index + 1] == "0" {
                inputTen = true
            }
            else if inputTen {
                totalScore += accumulatedScore
                accumulatedScore = 10
                inputTen = false
            }
            else{
                totalScore += accumulatedScore
                rightBeforeScore = accumulatedScore
                accumulatedScore = Int(cmpString)!
            }
        }
    }
    totalScore += accumulatedScore
    return totalScore
}