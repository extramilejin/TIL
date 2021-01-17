// 2021.01.16 extramilejin

// problem link: https://programmers.co.kr/learn/courses/30/lessons/12901

func solution(_ a:Int, _ b:Int) -> String {

    let daysOfMonth: [Int] = [0,31,29,31,30,31,30,31,31,30,31,30,31]
    var totalDaysFromDayOne: Int = 0
    for month in 1..<a {
        totalDaysFromDayOne += daysOfMonth[month]
    }
    
    totalDaysFromDayOne += b
    
    let weekByDays: [String] = ["THU","FRI","SAT","SUN","MON","TUE","WED"]
    
    let answer: String = weekByDays[totalDaysFromDayOne%7]
    
    return answer
}
