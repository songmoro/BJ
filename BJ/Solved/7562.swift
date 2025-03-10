//
//  7562.swift
//  BJ
//
//  Created by 송재훈 on 3/10/25.
//


//3
//8
//0 0
//7 0
//100
//0 0
//30 50
//10
//1 1
//1 1

let moves = [(-2, -1), (-2, 1), (-1, -2), (-1, 2), (1, -2), (1, 2), (2, -1), (2, 1)]
var T = Int(readLine()!)!

while T != 0 {
    T -= 1
    
    let L = Int(readLine()!)!
    
    let position = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: L), count: L)
    visit[position[0]][position[1]] = true
    let goal = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var queue = [(position[0], position[1], 0)]
    var index = 0
    
    while index < queue.count {
        let first = queue[index]
        index += 1
        
        if (first.0, first.1) == (goal[0], goal[1]) {
            print(first.2)
            break
        }
        
        for move in moves {
            let n = (first.0 + move.0, first.1 + move.1)
            
            if n.0 < 0 || n.0 >= L { continue }
            if n.1 < 0 || n.1 >= L { continue }
            if visit[n.0][n.1] { continue }
            
            visit[n.0][n.1] = true
            queue.append((n.0, n.1, first.2 +  1))
        }
    }
}
