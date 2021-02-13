func solution(_ msg:String) -> [Int] {
    var ret = [Int]()
    var dic = [String: Int]()
    // 딕셔너리에 아스키코드순으로 저장
    for i in 1...26 {
        let alphabet = String(UnicodeScalar(i + 64)!)
        dic[alphabet] = i
    }
    var idx = 27
    var start = msg.startIndex
    var end = start
    var tempStr: String = ""
    var offIndex = 0
    var cnt = 7
    while start < msg.endIndex {
        var subString = String(msg[start...end])
        if dic[subString] != nil {
            tempStr = subString
            offIndex += 1
            end = msg.index(start, offsetBy: offIndex)
        } else {
            ret.append(dic[tempStr]!)
            dic[subString] = idx
            idx += 1
            start = end
            end = start
            offIndex = 0
        }
        
        if end == msg.endIndex {
            ret.append(dic[tempStr]!)
            break
        }
    }
    return ret
}
