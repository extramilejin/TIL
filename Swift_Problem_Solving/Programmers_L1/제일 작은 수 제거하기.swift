// 2021.01.20 extramilejin

func solution(_ arr:[Int]) -> [Int] {
    let minValue = arr.min()
    return arr.isEmpty ? [-1] : arr.filter{$0 != minValue }
}