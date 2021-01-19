// 2021.01.20 extramilejin

// zip function 공부

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var answer  = arr1
    for row in 0..<arr1.count {
        for col in 0..<arr1[row].count {
            answer[row][col] = arr1[row][col] + arr2[row][col]
        }
    }
    return answer
}