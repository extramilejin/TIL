// 2021.01.28 extramilejin
// 2021.01.28 extramilejin

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var cnt = k
    var arr = Array<Int>()
    var numArray = number.map{Int(String($0))!}
    for i in 0..<number.count {
        while cnt > 0 && !arr.isEmpty && arr.last! < numArray[i] {
            arr.removeLast()
            cnt -= 1
        }
        arr.append(numArray[i])
    }
    var answer = ""
    for i in 0..<arr.count - cnt {
        answer += String(arr[i])
    }
    return answer
}