// 2021.01.30 extramilejin

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = [Bool](repeating: false, count: n)
    var network = 0
    func dfs(_ node: Int) -> Void{
        visited[node] = true
        for next in 0..<n {
            if computers[node][next] == 1 && !visited[next] {
                dfs(next)
            }
        }
        return
    }
    for i in 0..<n {
        if !visited[i] {
            dfs(i)
            network += 1
        }
    }
    return network
}