// 2021.01.10 extramilejin

// Error

// Swift에서 오류(Error)는 Error라는 프로토콜을 준수하는 타입의 값을 통해 표현된다.

// Error Protocol은 사실상 요구사항이 없는 빈 프로토콜이다.

// 주로 열거형이 이 프로토콜을 채택한다. 

import Swift

// 1. Error protocol 채택 enum 예시

    enum  VendingMachineError: Error {
        
        case invalidInput
        case insufficientFunds(moneyNeeded: Int)  //이거 괄호 무슨 뜻인지?
        case outOfStock
    }
    
    class VendingMachine {
        let itemPrice: Int = 100
        var itemCount: Int = 5
        var deposited: Int = 0
        
        func  receiveMoney(money: Int) throws {
            
            guard money > 0 else {
                throw VendingMachineError.invalidInput
            }
            
            self.deposited += money
            print("\(money)원 받음")
        }
        
        func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
            
            guard numberOfItemsToVend > 0 else {
                throw  VendingMachineError.invalidInput
            }
            
            guard numberOfItemsToVend*itemPrice <= deposited else {
                let moneyNeeded: Int
                moneyNeeded =  numberOfItemsToVend*itemPrice - deposited
                throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
            }
            
            guard itemCount >= numberOfItemsToVend else {
                throw VendingMachineError.outOfStock
            }
            
            let totalPrice = numberOfItemsToVend * itemPrice
            self.deposited -= totalPrice
            self.itemCount -= numberOfItemsToVend
            
            return "\(numberOfItemsToVend)개 제공함."
        }
    }
    
    
    let machine: VendingMachine = VendingMachine()
    
    
    // 함수에서 오류를 Throw 하면 그 오류를 처리하기 위한 코드를 작성해야한다.
    
    // 오류발생 여지가 있는 throw 함수는 try를 통해 호출해야한다.
    
    // try, do-catch, try? , try! 의 차이를 구별해보자.
    
    do {
        try machine.receiveMoney(money: 300)
    }catch let error {
        
        switch error {
            case VendingMachineError.invalidInput:
                print("입력이 잘못 되었습니다.")
                
            case VendingMachineError.outOfStock:
                print("현재 재고 부족상태입니다.")
                
            case VendingMachineError.insufficientFunds(let moneyNeeded):
                print("\(moneyNeeded)원이 부족합니다.")
                
            default:
                print("알수없는 오류 발생.")
        }
    }
    
    
    // try? 
    
    // 별도의 오류처리 결과를 통보 받지않고 결과값을 nil로 돌려받을 수 있다.
    
    // 정상 동작하면 옵셔널로 정상값을 돌려 받는다.
    
    var result: String?
    
    result = try? machine.vend(numberOfItems: 2)
    
    print(result)       //2개 제공함.
    
    print(machine.deposited)
    
    // try!
    
    // 오류가 발생하지 않을 것이라는 확신을 가질 때 try!를 사용하면 정상 동작후에 결과값을 받는다.
    
    // 오류가 발생하면 런타임 오류가 발생하며 어플리케이션이 동작 중지된다.
    
    var result2: String
    
    result2 = try! machine.vend(numberOfItems: 1)
    
    print(result2)          // 1개 제공함.
    
    print(machine.deposited)    //0
    
    
