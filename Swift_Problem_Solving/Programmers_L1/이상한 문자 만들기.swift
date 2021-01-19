// 2021.01.19 extramilejin

func solution(_ s:String) -> String {
    var answer = ""
    var arr: [Character] = s.map {$0}
    var indexFromSpace = 0
    for (index,char) in arr.enumerated() {
        if char == " " { 
            answer += " "
            indexFromSpace = 0
            continue
        } else {
            indexFromSpace += 1
            if indexFromSpace % 2 == 1 {answer += String(char).uppercased()}
            else {answer += String(char).lowercased()}
        }
    }
    return answer
}