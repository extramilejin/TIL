// 2021.01.21 extramilejin
// 다시 풀어보기

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var stageReachedPerson = Array(repeating: 0, count: N + 2)
    for stage in stages {
        stageReachedPerson[stage] += 1
    }
    var prefixSum = stageReachedPerson
    var tupleArray: [(Int, Double)] = [(Int, Double)]()
    for i in 1...N {
        prefixSum[N + 1 - i] += prefixSum[N + 1 - i + 1] 
        if stageReachedPerson[N + 1 - i] == 0 {
            tupleArray.append((N + 1 - i, 0))
        } else {
            tupleArray.append((N + 1 - i, Double(stageReachedPerson[N + 1 - i])/Double(prefixSum[N + 1 - i])))
        }
    }
    tupleArray.sort(by: {(a: (index: Int, failRatio: Double), b: (index: Int, failRatio: Double)) -> Bool in
                        if a.failRatio == b.failRatio {return a.index < b.index}
                         return a.failRatio > b.failRatio
                        })
    var answer: [Int] = [Int]()
    for (index, value) in tupleArray {
        answer.append(index)
    }
    return answer
}