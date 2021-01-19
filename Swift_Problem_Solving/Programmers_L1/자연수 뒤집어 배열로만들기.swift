// 2021.01.19 extramilejin

func solution(_ n:Int64) -> [Int] { return String(n).map{Int(String($0))!}.reversed()}