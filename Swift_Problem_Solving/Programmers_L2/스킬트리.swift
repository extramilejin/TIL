// 2021.01.25 extramilejin

// Topological sorted check

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var answer = 0
    let asciiOfA = Int("A".utf16["A".startIndex])
    var graph = Array(repeating: [Int](), count: 26)
    var incommingEdges = Array (repeating: 0, count: 26)
    var asciiSkill = skill.utf16.map{$0}
    
    for i in 0..<skill.count {
        var indexOfCurSkill = Int(asciiSkill[i]) - asciiOfA
        for j in 0..<i {
            var indexOfPrecedingSkill = Int(asciiSkill[j]) - asciiOfA
            graph[indexOfPrecedingSkill].append(indexOfCurSkill)
            incommingEdges[indexOfCurSkill] += 1
        }
    }
    
    for skill_tree in skill_trees {
        var possibleSkillTree = true
        var asciiSkillTree = skill_tree.utf16.map{$0}
        var skillTreeSize = skill_tree.count
        var numOfincommingEdges = incommingEdges
        
        for i in 0..<skillTreeSize {
            var indexOfPrecedingSkill = Int(asciiSkillTree[i]) - asciiOfA
            if numOfincommingEdges[indexOfPrecedingSkill] != 0 {
                possibleSkillTree = false
                break
            }
            for j in 0..<graph[indexOfPrecedingSkill].count {
                var indexOfNextSkill = graph[indexOfPrecedingSkill][j]
                numOfincommingEdges[indexOfNextSkill] -= 1
            }
        }
        if possibleSkillTree {answer += 1}
    }
    return answer
}
