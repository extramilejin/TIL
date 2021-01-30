// 2021.01.31 extramilejin 

func solution(_ n:Int) -> Int {
   var cache = [0,1]
   func fibo(_ k: Int) -> Int {
       if k < cache.count {
           return cache[k]
       } else {
           cache.append(fibo(k - 1) + fibo(k - 2))
           return cache[k] % 1234567
       }
   }
   return fibo(n)
}