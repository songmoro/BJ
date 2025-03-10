//
//  2660.swift
//  BJ
//
//  Created by 송재훈 on 2/23/25.
//


//5
//1 2
//2 3
//3 4
//4 5
//2 4
//5 3
//-1 -1

let member = Int(readLine()!)!
var members: [[Int]] = .init(repeating: [], count: member + 1)

while true {
    let input = readLine()!.split(separator: " ").map({ Int($0)! })
    let (A, B) = (input[0], input[1])
    
    if A == -1, B == -1 { break }
    members[A].append(B)
    members[B].append(A)
}

var minScore = Int.max
var candidates = [Int]()

for i in 1...member {
    var queue = [i]
    var visited: [Int] = .init(repeating: 0, count: member + 1)
    
    while !queue.isEmpty {
        let first = queue.removeFirst()
        
        for next in members[first] where visited[next] == 0 && next != i {
            visited[next] = visited[first] + 1
            queue.append(next)
        }
    }
    
    let maxScore = visited.max()!
    
    if maxScore < minScore {
        minScore = maxScore
        candidates = [i]
    }
    else if maxScore == minScore {
        candidates.append(i)
    }
}

print(minScore, candidates.count)
print(candidates.map({ String($0) }).joined(separator: " "))
