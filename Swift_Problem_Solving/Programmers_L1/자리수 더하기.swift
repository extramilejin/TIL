// 2021.01.19 extramilejin

import Foundation

func solution(_ n:Int) -> Int {return String(n).map{Int(String($0))!}.reduce(0){$0 + $1}}