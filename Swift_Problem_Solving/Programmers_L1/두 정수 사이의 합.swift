// 2021.01.17 extramilejin

// problem link: https://programmers.co.kr/learn/courses/30/lessons/12912

func solution(_ a:Int, _ b:Int) -> Int64 {
    let result = (a + b) * (abs(a - b) + 1) / 2
    return Int64(result)
}
