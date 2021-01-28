// 2021.01.28 extramilejin

import Foundation

func solution(_ clothes: [[String]]) -> Int {
    
    var answer = 1
    var dic: Dictionary<String, [String]> = [:]
    
    for clothe in clothes {
        if dic[clothe[1]] != nil {
            dic[clothe[1]]!.append(clothe[0])
        } else {
            dic[clothe[1]] = [clothe[0]]
        }
    }
    
    for (key, value) in dic {
        answer *= (value.count + 1)
    }
    
    return answer - 1
}