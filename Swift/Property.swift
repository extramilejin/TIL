// 2021.01.06 extramilejin

// Property

import Swift

    // 프로퍼티는 크게 저장 프로퍼티, 연산 프로퍼티, 타입 프로퍼티가 있다.
    
    // 프로퍼티는 구조체, 클래스 ,열거형에 구현 가능하다. 단, 열거형에는 연산 프로퍼티만 구현 가능하다.
    
    // 연산 프로퍼티는 var로만 선언이 가능하다. 읽기 전용으로만 구현이 가능하다.
    
    // set 블럭에서 암시적 매개변수 newValue를 사용할 수 있다.
    
    // 저장 프로퍼티와 연산 프로퍼티의 기능은 함수, 메서드, 클로저, 타입 외부에 위치한 지역/ 전역 변수에서도 사용 가능하다.
    
    

// 1. 예시

    struct Money {
    
        // 저장 프로퍼티
    
        var currencyRate: Double = 1100
        
        var dollar: Double = 0
        
        // 연산 프로퍼티 
        
        var won: Double {
        
            get{
                return dollar * currencyRate
            }
            
            set{
                dollar = newValue / currencyRate
            }
            
        }
        
    }
    
    var myMoney = Money()
    
    myMoney.dollar = 100
    
    print(myMoney.won)
    
    myMoney.won = 300000
    
    print(myMoney.dollar)
    
    // 함수, 메서드, 클로저 , 타입 외부의 지역/ 전역변수
    
    var a: Int = 100
    
    var b: Int = 200
    
    var sum: Int {
        return a + b
    }
    
    print(sum)
    
    
    
// 2. 지연 저장 프로퍼티 Lazy Stored Properties

    // 인스턴스를 생성할 때 프로퍼티에 값이 필요 없다면 프로퍼티를 옵셔널로 선언해줄 수 있습니다.
    
    // 지연 저장 프로퍼티는 호출이 있어야 값을 초기화 하며 키워드로 lazy를 사용합니다.
    
    struct Point {
    
        var x: Int = 0
        
        var y: Int = 0
        
    }
    
    class Position {
    
        lazy var point: Point = Point()
        
        let name: String
        
        init(name: String) {
        
            self.name = name
            
        }
        
    }
    
    let ejPosition: Position = Position(name: "extramilejin")
    
    print(ejPosition.point) //point 프로퍼티로 처음 접근할 때 point 프로퍼티의 Point 구조체 인스턴스가 생성 된다.
    
    
// 3. 프로퍼티 감시자 Properties Observer
    
   // 프로퍼티 감시자를 사용하면 프로퍼티 값이 변경됨에 따라 적절한 작업을 취할 수 있습니다.
   
   // 변경값이 직전값과 같더라도 호출 한다. 
   
   // 프로퍼티 감시자는 상속받은 저장 프로퍼티 연산프로퍼티에 적용 할 수 있다. 연산 프로퍼티는 상속받았을 때만 프로퍼티 재정의를 통해
   
   // 프로퍼티 감시자를 사용한다.
   
   class Account {
   
        // 저장 프로퍼티 감시자
        
       static var bank: String = "Hana Bank"
       
       var won: Int = 0 {
           
            willSet {
                
                print("잔액이 \(won)원에서 \(newValue)원으로 변경될 예정입니다.")
                
            }
            
            didSet {
                
                print("잔액이 \(oldValue)원에서 \(won)원으로 변경되었습니다.")
                
            }
            
       }
       
       // 연산 프로퍼티 <- 감시자 아님, 연산 프로퍼티 감시자는 상속받았을 때만 사용 가능하다.
       
       var dollar: Double {
           
           get {
              
              return Double(won) / 1000.0
              
           }
           
           set {
               
               won = Int(newValue * 1000)
               print("잔액을 \(newValue) 달러로 변경 중입니다.")
               
           }
           
       }
       
   }
   
   let myAccount: Account = Account()
   
   myAccount.won = 1000
   
   myAccount.dollar = 1000.0
   
   print(Account.bank)
   
   class ForeignAccount: Account {
   
       // 상속 받은 연산 프로퍼티의 프로퍼티 감시자
       
       override var dollar: Double {
           
           willSet {
           
               print("외국 통장 잔액이 \(dollar)달러에서 \(newValue)달러로 변경될 예정입니다.")
               
           }
           
           didSet {
               
               print("외국 통장 잔액이 \(oldValue)달러에서 \(dollar)로 변경되었습니다.")
               
           }
           
       }
       
   }
   
   let myForeignAccount: ForeignAccount = ForeignAccount()
   
   myForeignAccount.won = 1000
   
   myForeignAccount.dollar = 3000
   
    // 외국 통장 잔액이 1.0달러에서 3000.0달러로 변경될 예정입니다.
    // 잔액이 1000원에서 3000000원으로 변경될 예정입니다.
    // 잔액이 1000원에서 3000000원으로 변경되었습니다.
    // 잔액을 3000.0 달러로 변경 중입니다.
    // 외국 통장 잔액이 1.0달러에서 3000.0로 변경되었습니다.
    
    
//  4. 타입 프로퍼티

    // static 키워드를 사용하며 연산 타입 프로퍼티는 변수로만 선언 가능하다.
    
    // 저장 타입 프로퍼티는 반드시 초깃값을 설정해야 하며 지연 연산된다. 다중 스레드 환경에서 단 한 번만 초기화 된다는 보장을 받는다.
