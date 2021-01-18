// 2021.01.18 extramilejin

func solution(_ s:String) -> Int {
    var result: Int = 0
    
    if s[s.startIndex] == "-" {
        let start = s.index(after: s.startIndex)
        var newStr = s[start..<s.endIndex]
        result = -Int(String(newStr))!
    }
    else if s[s.startIndex] == "+" {
        let start = s.index(after: s.startIndex)
        var newStr = s[start..<s.endIndex]
        result = Int(String(newStr))!
    }
    else {result = Int(s)!}
    
    return result
}
