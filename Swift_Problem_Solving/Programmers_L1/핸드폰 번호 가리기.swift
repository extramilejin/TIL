// 2021.01.20 extramilejin

// String.suffix 사용 생각해보기

// String(repeating: , count: )

func solution(_ phone_number:String) -> String {
    var answer = ""
    for i in 0..<phone_number.count {
        if i < phone_number.count - 4 {answer += "*"}
        else {answer += String(phone_number.map{$0}[i])}
    }
    return answer
}