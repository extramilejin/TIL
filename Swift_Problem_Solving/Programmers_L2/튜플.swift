// 2021.01.30 extramilejin
import Foundation

func solution(_ s:String) -> [Int] {
    var splitedStrs = String(s[s.index(s.startIndex, offsetBy: 2)..<s.index(s.endIndex, offsetBy: -2)]).split(separator: "}").map{$0}
    var sets: [[Int]] = []
    var answer: [Int] = []
    for str in splitedStrs {
        var removedStr = str.filter{$0 != "{"}.split(separator: ",")
        var `set` = [Int]()
        for num in removedStr {
            `set`.append(Int(num)!) 
        }
        sets.append(`set`)
    }
    sets.sort(by: {(a: [Int], b: [Int]) -> Bool in
                        return a.count < b.count})
    for `set` in sets {
        for element in `set` {
            if answer.contains(element) == false {
                answer.append(element)
            }
        }
    }
    
    return answer
}