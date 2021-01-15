// 2021.01.05 extramilejin

// Loop

import Swift


// 1. for - in statement

    // for item in items{
    
    //     statement
        
    // }

// 2. for - in statement 예시
    
    var nums: Array<Int> = [1,2,3]
    
    for num in nums {
    
        print(num)
        
    }
    
    var persons: Dictionary<String, Int> = ["extramilejin":28,"simson":54]
    
    for (name, age) in persons {
        
        print("\(name): \(age)")
        
    }
    
    var planets: Set<String> = ["Sun","earth","moon","vinus"]
    
    for planet in planets {
        
        print(planet)
        
    }
    
    
// 3. while 

    // 기본 형태
    
    // while condition {
    
    //     statement
        
    // }
    
// 4. while 구문 예시

   var anotherNums: Array<Int> = [1,2,3,4,5]
   
   while anotherNums.count > 1 {
       
       print(anotherNums.count)
       
       anotherNums.removeLast()
     
   }
   
// 5. repeat - while 

    var someNums: Array<Int> = [1,2,3,4,5]
   
    repeat {
       
       print(someNums.count)
       
       someNums.removeLast()
     
    } while someNums.count > 1


