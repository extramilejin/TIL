// 2021.01.18 extramilejin

func solution(_ n:Int) -> String {
    var result = Array(repeating: "����",count: n / 2).reduce(""){$0 + $1}
    return n % 2 == 0 ? result : result + "��"
}
