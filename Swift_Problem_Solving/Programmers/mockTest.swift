//2021.01.15 extramilejin
//problem link: https://programmers.co.kr/learn/courses/30/lessons/42840

import Foundation

let noMathLife: [[Int]] = [[1,2,3,4,5],[2,1,2,3,2,4,2,5],[3,3,1,1,2,2,4,4,5,5]]

func solution(_ answers:[Int]) -> [Int] {
    var personScore: [Int] = [0,0,0]
    for i in 0..<3 {
        for (index, answer) in answers.enumerated() {
            if noMathLife[i][index%(noMathLife[i].count)] == answer {personScore[i] += 1}
        }
    }
    var maxScore: Int = 0
    var ans: [Int] = [Int]()
    for (index, score) in personScore.enumerated() {
        if score > maxScore {
            maxScore = score
            ans.removeAll()
            ans.append(index + 1)
        }
        else if(score == maxScore){
            ans.append(index + 1)
        }
    }
    return ans.sorted(by: <)
}
