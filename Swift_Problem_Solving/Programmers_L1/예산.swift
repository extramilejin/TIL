// 2021.01.24 extramilejin

import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var sortedBudgetRequests = d.sorted(by: <)
    var leftedBudget = budget
    var answer = 0
    for request in sortedBudgetRequests {
        if request > leftedBudget { break }
        leftedBudget -= request
        answer += 1
    }
    return answer
}