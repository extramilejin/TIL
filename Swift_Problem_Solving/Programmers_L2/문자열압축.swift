// 2021.01.28 extramilejin

import Foundation

func solution(_ s:String) -> Int {
    var answer = s.count + 1
    var str = s.map{$0}
    for splitSize in 1...s.count {
        var curIndex = 0
        var compressedString = ""
        var arr = [String]()
        while true {
            guard curIndex + splitSize <= s.count else { break }
            var splitedString = String(str[curIndex..<curIndex + splitSize])
            
            if arr.isEmpty {
                arr.append(splitedString)
            } else if arr.last! != splitedString {
                compressedString += arr.count == 1 ? arr.last! : "\(arr.count)" + arr.last! 
                arr.removeAll()
                arr.append(splitedString)
            } else {
                arr.append(splitedString)
            }
            curIndex += splitSize
        }
        
        if !arr.isEmpty {
            if arr.count > 1 {
                compressedString += "\(arr.count)" + arr.last! 
            } else {
                compressedString +=  arr.last! 
            }
        }
        
        if curIndex <= str.count - 1 {
            compressedString += String(str[curIndex...str.count - 1])
        }
        if compressedString.count < answer {
            answer = compressedString.count
        }
    }
    return answer
}