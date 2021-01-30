// 2021.01.29 extramilejin

import Foundation

func solution(_ name:String) -> Int {
    
    let target = name.utf16.map{Int($0) - 65}
    var make = String(repeating: "A", count: name.count).utf16.map{Int($0) - 65}
    var curPos = 0 , answer = 0
    var visited = [Bool](repeating: false, count: name.count)
    for i in 0..<name.count {
        if make[i] == target[i] {
            visited[i] = true
        }
    }
    
    func moveCursor(_ cur: Int) -> Int {
        visited[cur] = true
        var minDist = 21
        var nextCurPos = 0
        for i in 0..<name.count {
            if visited[i] == false {
                var dist = abs(cur - i) 
                dist = dist < name.count - dist ? dist : name.count - dist
                if minDist > dist {
                    minDist = dist
                    nextCurPos = i
                }
            }
        }  
        if visited.contains(false) == false {minDist = 0}
        answer += (minDist + shortestPathAToB(make[cur], target[cur]))
        return nextCurPos
    }
    
    func shortestPathAToB(_ a: Int, _ b: Int) -> Int {
        let dist = abs(b - a)
        if dist == 0 {
            return 0
        } else {
            return dist < 26 - dist ? dist : 26 - dist 
        }
    }
    
    var pos = 0
    while true {
        if visited.contains(false) == false {
            break
        } 
        pos = moveCursor(pos)
    }
    
    return answer
}