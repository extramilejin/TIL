// 2021.01.05 extramilejin

// conditioanl statements

import Swift


// 1. if-else statement

    // if condition1 {
        
    // } else if condition2{
        
    // } else {
        
    // }
    
    // 반드시 조건값에는 Bool 타입의 값만 위치해야한다. 조건을 감싸는 소괄호는 선택사항.

// 2. if-else 예시
    
    let score: Int = 55
    
    if score < 100 {
    
        print("100 미만")
        
    } else if score > 100 {
        
        print("100 초과")
        
    } else {
        
        print("\(score)점")
    }
    
    
// 3. Switch 구문

    // 비교 시 대부분의 Swift 기본타입을 지원, case 당 여러 pattern 이 등장 할 수 있다.
    
    // case 내부에는 실행가능한 코드가 반드시 위치해야 한다.
    
    // 예외적인 케이스(enum)를 제외하고 반드시 default문을 작성해야한다.
    
    // 자동으로 case 마다 break 가 된다.
    
    // fallthrough 키워드를 이용하여 break를 무시 할 수 있다.

    // 기본 형태
    
    // switch 비교값 {
        
    //     case pattern:
    //         실행구문
    
    //     case pattern2:
    //         실행구문
    
    //     default: 
    //         실행구문
    // }   
    
// 4. switch 구문 예시

    //비교 값과 case pattern의 타입을 동일하게 해야 한다.

    let myScore: Int = 70
    
    switch myScore {
        
        case 90...Int.max:
            print("A+")
        case 70..<90:       //70이상 90미만의 범위연산자 표현
            print("B+")
        case 20..<70:
            print("C+")
        default:
            print("F")
    }
    
    let someCharacter: Character = "ㄱ"
    
    switch someCharacter {
        
        case "ㄱ","ㄴ","ㄷ","ㄹ","ㅁ","ㅂ","ㅅ","ㅇ","ㅈ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ":
            print("\(someCharacter)은 자음 입니다.")
        
        case "ㅏ","ㅑ","ㅓ","ㅕ","ㅜ","ㅠ","ㅡ","ㅣ","ㅐ","ㅔ":
            print("\(someCharacter)은 모음 입니다.")
            
        default:
            print("\(someCharacter)은 자음도 모음도 아닙니다.")
    }
