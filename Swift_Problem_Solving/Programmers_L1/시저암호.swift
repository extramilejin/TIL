// 2021.01.18 extramilejin

func solution(_ s:String, _ n:Int) -> String {
    var answer = ""
    for character in s.utf16 {
        var asciiCode = Int(character)
        switch asciiCode {
            case 65...90: 
                asciiCode = (asciiCode - 65 + n) % 26 + 65
                answer += String(UnicodeScalar(asciiCode)!)
            case 97...122:
                asciiCode = (asciiCode - 97 + n) % 26 + 97
                answer += String(UnicodeScalar(asciiCode)!)
            default:
                answer += " "
        }
    }
    return answer
}
