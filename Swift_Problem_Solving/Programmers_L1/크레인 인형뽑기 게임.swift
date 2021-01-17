//2021.01.15 extramilejin

import Foundation

public struct Stack<Element> {
    
    private var storage = Array<Element>()
    public init(_ element: [Element]) {
        storage = element 
    }
    public init() {}
    
    public mutating func push(_ element: Element) { 
        storage.append(element)
    }
    
    @discardableResult 
    public mutating func pop() -> Element? { 
        return storage.popLast()
    }
    
    public func peek() -> Element? {
        return storage.last
    }
    
    public var isEmpty: Bool {
        return peek() == nil
    } 
}

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    var newBoard: [[Int]] = board
    var answer: Int = 0
    var bucket: Stack<Int> = Stack<Int>()
    let sizeOfBoard: Int = board.count
    
    for move in moves {
        var nextItem: Int = 0
        for row in 0..<sizeOfBoard {
            if newBoard[row][move-1] != 0{
                nextItem = newBoard[row][move-1]
                newBoard[row][move-1] = 0 
                break
            }
        }
        
        if(nextItem == 0) {continue}
        
        if bucket.isEmpty {
            bucket.push(nextItem)
        }
        else if bucket.peek()! == nextItem {
            answer += 2
            bucket.pop()
        } 
        else {
            bucket.push(nextItem)
        }
    }
    
    return answer
}
