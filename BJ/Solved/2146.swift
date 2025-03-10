//
//  2146.swift
//  BJ
//
//  Created by 송재훈 on 3/10/25.
//


//10
//1 1 1 0 0 0 0 1 1 1
//1 1 1 1 0 0 0 0 1 1
//1 0 1 1 0 0 0 0 1 1
//0 0 1 1 1 0 0 0 0 1
//0 0 0 1 0 0 0 0 0 1
//0 0 0 0 0 0 0 0 0 1
//0 0 0 0 0 0 0 0 0 0
//0 0 0 0 1 1 0 0 0 0
//0 0 0 0 1 1 1 0 0 0
//0 0 0 0 0 0 0 0 0 0


let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let N = Int(readLine()!)!
var island = [[Int]]()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    island.append(input)
}

var minCost = Int.max
var visit = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
var grounds = [(Int, Int, Int)]()

var number = 2
for i in 0..<N {
    for j in 0..<N where island[i][j] == 1 {
        visit[i][j] = true
        island[i][j] = number
        grounds.append((i, j, 0))
        
        var queue = [(i, j)]
        var index = 0
        
        while index < queue.count {
            let first = queue[index]
            index += 1
            
            for move in moves {
                let n = (first.0 + move.0, first.1 + move.1)
                
                if n.0 < 0 || n.1 < 0 || n.0 >= N || n.1 >= N { continue }
                if visit[n.0][n.1] || island[n.0][n.1] == 0 { continue }
                
                visit[n.0][n.1] = true
                island[n.0][n.1] = number
                grounds.append((n.0, n.1, 0))
                queue.append(n)
            }
        }
        
        number += 1
    }
}

for ground in grounds {
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    visited[ground.0][ground.1] = true
    let original = island[ground.0][ground.1]
    var queue = [ground]
    var index = 0
    
    while index < queue.count {
        let first = queue[index]
        index += 1
        
        for move in moves {
            let n = (first.0 + move.0, first.1 + move.1, first.2 + 1)
            
            if n.0 < 0 || n.1 < 0 || n.0 >= N || n.1 >= N { continue }
            if visited[n.0][n.1] { continue }
            if island[n.0][n.1] == original { continue }
            
            if island[n.0][n.1] == 0 {
                visited[n.0][n.1] = true
                queue.append(n)
            }
            else {
                minCost = min(minCost, n.2 - 1)
            }
        }
    }
}

print(minCost)
