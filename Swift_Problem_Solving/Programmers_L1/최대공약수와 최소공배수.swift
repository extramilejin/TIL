// 2021.01.20 extramilejin

func gcd(_ a: Int, _ b: Int) -> Int {
    let mod: Int = a % b
    return 0 == mod ? min(a, b) : gcd(b, mod)
}
func solution(_ n:Int, _ m:Int) -> [Int] {
    return [gcd(n, m), n * m/gcd(n, m)]
}