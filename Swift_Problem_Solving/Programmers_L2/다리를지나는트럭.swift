// 2021.01.27 extramilejin

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var waitingTrucks: [Int] = truck_weights
    var onBridgeTrucks: [(weight: Int, onBridgeTime: Int)] = []
    var onBridgeWeight = 0
    var answer = 0
    var leftedCount = truck_weights.count
    
    while leftedCount != 0 {
        
        for i in 0..<onBridgeTrucks.count {
            onBridgeTrucks[i].onBridgeTime += 1
        }
        
        if let passingTruck = onBridgeTrucks.first {
            if passingTruck.onBridgeTime == bridge_length {
               onBridgeWeight -= passingTruck.weight
               onBridgeTrucks.removeFirst()
               leftedCount -= 1
               //print("\(passingTruck.weight) OUT in time: \(answer)")
            }
        } 
        
        if let nextTruckWeight = waitingTrucks.first {
            if onBridgeWeight + nextTruckWeight <= weight && onBridgeTrucks.count < bridge_length {
               onBridgeWeight += nextTruckWeight
               onBridgeTrucks.append((nextTruckWeight, 0))
               waitingTrucks.removeFirst()
               //print("\(nextTruckWeight) IN in time: \(answer)")
            }
        }
        
        answer += 1
    }
    return answer
}