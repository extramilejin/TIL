// 2021.01.17 extramilejin

import Foundation

func solution(_ s:String) -> Bool
{
    var ans:Bool = false
    
    var countp = 0
    var county = 0
    
    for char in s {
        switch char {
            case "p","P": countp += 1
            case "y","Y": county += 1
            default : break
        }
    }
    if countp == county {ans = true}
    return ans
}
