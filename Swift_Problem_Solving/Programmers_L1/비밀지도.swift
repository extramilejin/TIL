// 2021.01.24 extramilejin

func paddingZeros (string: String, toSize: Int) -> String {
    var resultString = string
    for _ in 0..<(toSize - string.count) {
        resultString = "0" + resultString
    }
    return resultString
}

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    for row in 0..<n {
       var rowFromArr1 = paddingZeros(string: String(arr1[row], radix: 2), toSize: n).map{$0}
       var rowFromArr2 = paddingZeros(string: String(arr2[row], radix: 2), toSize: n).map{$0}
       var rowForAnswer = ""
       for col in 0..<n {
            if rowFromArr1[col] == "1" || rowFromArr2[col] == "1" {
                rowForAnswer += "#"
            }
            else{
                rowForAnswer += " "
            }
        }
        answer.append(rowForAnswer)
    }
    return answer
}