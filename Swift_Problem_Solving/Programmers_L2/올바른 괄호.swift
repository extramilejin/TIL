// 2021.01.25 extramilejin

import Foundation

func solution(_ s:String) -> Bool
{
    var ans:Bool = true
    var stackArray: Array<Int> = []
    for braket in s {
        print(type(of: "("))
        if braket == "(" {stackArray.append(1)}
        else {
            if stackArray.last == 1 {
                stackArray.removeLast()
            }
            else {
                ans =  false 
                break
            }
        }
    }
    if stackArray.isEmpty == false { ans = false }
    return ans
}