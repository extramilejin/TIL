//2021.01.15 extramilejin
//Problem Link: https://www.acmicpc.net/problem/2606

let numberOfComputer = Int(readLine()!)!
let numberOfConnection = Int(readLine()!)!
var adjList = Array(repeating: [Int](),count: numberOfComputer + 1)

for _ in 0..<numberOfConnection {
    let nodes = readLine()!.split(separator: " ").map {Int(String($0))!}
    adjList[nodes[0]].append(nodes[1])
    adjList[nodes[1]].append(nodes[0])
}

var visited = Array(repeating: false, count: numberOfComputer + 1)

var cnt:Int = 0

func dfs(currentNode: Int) {
    visited[currentNode] = true
    for adjNode in adjList[currentNode] {
        if visited[adjNode] {continue}
        cnt += 1
        dfs(currentNode: adjNode)
    }
}

dfs(currentNode: 1)
print(cnt)
