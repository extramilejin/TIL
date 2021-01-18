// 2021.01.18 extramilejin

func numberOfPrimesFromOneToN (n: Int) -> Int {
    var eratos: [Bool] = Array(repeating: true , count: n + 1) 
    for maybePrime in 2...n {
        if eratos[maybePrime] == false {continue}
        var mul = 2
        while(mul * maybePrime <= n){
            eratos[maybePrime * mul] = false
            mul += 1
        }
    }
    var answer = 0   
    for mustbePrime in 2...n {
        if eratos[mustbePrime] == true {answer += 1}
    }
    return answer
} 

func solution(_ n:Int) -> Int {
    return numberOfPrimesFromOneToN(n: n)
}
