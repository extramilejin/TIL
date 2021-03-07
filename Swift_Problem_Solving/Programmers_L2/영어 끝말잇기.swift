// 2021.03.07 extramilejin

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var arrWords = words.map{$0}
    var alreadySpoken: Set<String> = []
    var lastAlphabet: Character = arrWords[0].first!
    for idx in 0..<arrWords.count{
        if lastAlphabet != arrWords[idx].first! {
            return [(idx % n) + 1, (idx / n) + 1]
        } else if alreadySpoken.contains(arrWords[idx]) {
            return [(idx % n) + 1, (idx / n) + 1]
        } else {
            alreadySpoken.insert(arrWords[idx])
            lastAlphabet = arrWords[idx].last!
        }
    }
    return [0, 0]
}
