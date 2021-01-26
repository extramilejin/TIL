// 2021.01.26 extramilejin

import Foundation

func solution(_ record:[String]) -> [String] {
    var userIdAndNickname: Dictionary<String, String> = [:]
    var answer: [[String]] = []
    for log in record {
        var splitedLog = log.split(separator: " ").map{String($0)}
        var ELC = splitedLog[0]
        switch ELC {
            case "Enter": 
            userIdAndNickname[splitedLog[1]] = splitedLog[2]
            answer.append([splitedLog[1],"님이 들어왔습니다."])
            case "Leave": 
            answer.append([splitedLog[1],"님이 나갔습니다."])
            case "Change": 
            userIdAndNickname[splitedLog[1]] = splitedLog[2]
            default: break
        }
    }
    return answer.map{userIdAndNickname[$0[0]]!+$0[1]}
}
