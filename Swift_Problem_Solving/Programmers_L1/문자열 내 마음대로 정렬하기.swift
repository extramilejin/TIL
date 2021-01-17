// 2021.01.17 extramilejin

// problem link : https://programmers.co.kr/learn/courses/30/lessons/12915

func solution(_ strings:[String], _ n:Int) -> [String] {
    var answer = strings.sorted(by: {(a: String, b: String) -> Bool in 
        if a[a.index(a.startIndex, offsetBy: n)] == b[b.index(b.startIndex, offsetBy: n)] {
            return a < b
        }
        return a[a.index(a.startIndex, offsetBy: n)] < b[b.index(b.startIndex, offsetBy: n)]}
    )
    return answer
}
