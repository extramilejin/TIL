// 2021.01.30 extramilejin 

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    
    var graph = [[Int]](repeating: [Int](), count: n + 1)  
    var dists = [Int](repeating: -1, count: n + 1)
    
    for e in edge {
        graph[e[0]].append(e[1])
        graph[e[1]].append(e[0]) 
    }
    
    func bfs(node: Int) {
        dists[node] = 0
        var queue = [(node, 0)]
        while !queue.isEmpty {
            let cur = queue.first!
            queue.removeFirst()
            for next in graph[cur.0] {
                if dists[next] == -1 {
                    dists[next] = cur.1 + 1
                    queue.append((next, cur.1 + 1))
                }
            }
        }
    }
    bfs(node: 1)
    let maxVal = dists.max()!
    return dists.filter{$0 == maxVal}.count
}
