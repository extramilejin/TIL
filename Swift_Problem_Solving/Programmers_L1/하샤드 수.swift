// 2021.01.20 extramilejin

func solution(_ x:Int) -> Bool {
    return x % String(x).map{Int(String($0))!}.reduce(0){$0 + $1} == 0 ? true : false
}