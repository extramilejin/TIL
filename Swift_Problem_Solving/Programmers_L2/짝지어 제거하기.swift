// 2021.03.07 extramilejin

import Foundation

func solution(_ s:String) -> Int{
    var answer:Int = 0
    var stack: [Character] = []
    for char in s {
        if stack.isEmpty {
            stack.append(char)
        } else {
            if let top = stack.last {
                if top == char {
                    stack.removeLast()
                } else {
                    stack.append(char)
                }
            }
        }
    }
    return stack.isEmpty ? 1 : 0
}
