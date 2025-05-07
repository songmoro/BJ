//
//  7562-2.swift
//  BJ
//
//  Created by 송재훈 on 5/7/25.
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

let dx = [-2, -2, -1, -1, 1, 1, 2, 2]
let dy = [-1, 1, -2, 2, -2, 2, -1, 1]

let T = Int(readLine()!)!

for _ in 0..<T {
    let L = Int(readLine()!)!
    let start = readLine()!.split(separator: " ").map { Int(String($0))! }
    let goal = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    if start == goal {
        print(0)
        continue
    }
    var visited = Array(repeating: Array(repeating: -1, count: L), count: L)
    var queue = [(start[0], start[1])]
    var i = 0
    visited[start[0]][start[1]] = 0
    var answer = 0
    
loop:
    while i < queue.count {
        let (x, y) = queue[i]
        i += 1
        
        for d in 0...7 {
            let nx = x + dx[d]
            let ny = y + dy[d]
            
            if 0..<L ~= nx, 0..<L ~= ny, visited[nx][ny] == -1 {
                visited[nx][ny] = visited[x][y] + 1
                queue.append((nx, ny))
                answer = visited[nx][ny]
                
                if [nx, ny] == goal {
                    print(answer)
                    break loop
                }
            }
        }
    }
}
