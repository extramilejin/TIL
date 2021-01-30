// 2021.01.30 extramilejin

func solution(_ s:String) -> String {
    var str = s.split(separator: " ").map{Int($0)!}
    return "\(str.min()!) \(str.max()!)"
}