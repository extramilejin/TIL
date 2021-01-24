// 2021.01.24 extramilejin

import Foundation

struct Position {
    var row: Int 
    var col: Int 
    init (num: Int){
        if num == 0 {
            self.row = 3
            self.col = 1
        }
        else{
            self.row = (num - 1) / 3
            self.col = (num - 1) % 3
        }
    }
    init (row: Int, col: Int){
        self.row = row
        self.col = col
    }
}

func solution(_ numbers:[Int], _ hand:String) -> String {
    var returnString = ""
    var rightHand = Position (row: 3, col: 0)
    var leftHand = Position (row:3, col: 2)
    for number in numbers {
        var numberPos = Position(num: number)
        var distFromR = abs(rightHand.row - numberPos.row) + abs(rightHand.col - numberPos.col)
        var distFromL = abs(leftHand.row - numberPos.row) + abs(leftHand.col - numberPos.col)
        if [1,4,7].contains(number) {
            returnString += "L"
            leftHand = numberPos
        }
        else if [3,6,9].contains(number) {
            returnString += "R"
            rightHand = numberPos
        }
        else{
            if (distFromR < distFromL) {
                returnString += "R"
                rightHand = numberPos
            }
            else if(distFromR == distFromL){
                if hand == "right" {
                    returnString += "R"
                    rightHand = numberPos
                }
                else {
                    returnString += "L"
                    leftHand = numberPos
                }
            }
            else {
                returnString += "L"
                leftHand = numberPos
            }
        }
    }
    
    return returnString
}