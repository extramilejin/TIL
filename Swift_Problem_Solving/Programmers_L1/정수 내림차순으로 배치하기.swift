// 2021.01.19 extramilejin

func solution(_ n:Int64) -> Int64 { return Int64(String(n).map{ Int(String($0))! }.sorted(by: >).reduce(""){ String($0) + String($1) })!}