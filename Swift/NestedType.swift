// 2021.01.14 extramilejin

// Nested Type 타입 중첩.

// 특정 타입을 클래스나 구조체 내부에 선언하여 그 안에서만 사용할 수 있게끔 선언한것을 중첩 타입이라 한다.

// 예시 1

class Person {
    
    enum Job {
        case jobless,student,programmer
    }
    
    var job: Job = .jobless 
}

class Student: Person {
    
    enum School {
        case elementary, middle, high
    }
    
    var school: School
    
    init(school: School){
        self.school = school
        super.init()
        self.job = .student
    }
}

var extramilejin: Person = Person()

var melisa: Student = Student(school: .middle)

// 중첩 타입은 상위 클래스나 구조체의 자신보다 앞에 적어줘야 한다. 

var personJob: Person.Job = .programmer

print(personJob)    // programmer


// 예시 2

struct Sports {
    
    enum GameType {
        case basketball, football
    }
    
    var gameType: GameType
    
    struct GameInfo {
        var timeOfGame: Int
        var numberOfPlayer: Int
    }
    
    var gameInfo: GameInfo {
        switch self.gameType {
            case .basketball: 
                return GameInfo(timeOfGame: 40, numberOfPlayer: 5)
            case .football:
                return GameInfo(timeOfGame: 90, numberOfPlayer: 11)
            
        }
    }
}

var basketball: Sports = Sports(gameType: .basketball)

var football: Sports = Sports(gameType: .football)

print(football.gameInfo)    // GameInfo(timeOfGame: 90, numberOfPlayer: 11)
