// 2021.01.26 extramilejin

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var answer = 1
    var printerQueue: [(Int, Bool)] = []
    for index in 0..<priorities.count {
        var markOfMyDoc = false
        if index == location {markOfMyDoc = true}
         printerQueue.append((priorities[index], markOfMyDoc))
    }
    
    var sortedPriorities = priorities.sorted(by: >)
    var curIndex = 0
    
    while printerQueue.isEmpty == false {
        if printerQueue.first!.0 == sortedPriorities[curIndex] {
            if printerQueue.first!.1 == true {break}
            else {
                printerQueue.removeFirst()
                curIndex += 1
                answer += 1
            }
        }
        else {
             printerQueue.append(printerQueue.removeFirst())
        }
    }
    return answer 
}
