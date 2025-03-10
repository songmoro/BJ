//
//  2178.swift
//  BJ
//
//  Created by 송재훈 on 2/14/25.
//


//4 6
//101111
//101010
//101011
//111011

let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let NM = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, M) = (NM[0], NM[1])

var maze = [[Bool]]()

for _ in 0..<N {
    maze.append(readLine()!.map({ String($0) == "1" }))
}

var visit: [[Int]] = .init(repeating: .init(repeating: 0, count: M), count: N)
visit[0][0] = 1

var queue = [(0, 0)]

while !queue.isEmpty {
    let first = queue.removeFirst()
    
    for direction in directions {
        let d = (direction.0 + first.0, direction.1 + first.1)
        
        if d.0 >= 0, d.1 >= 0, d.0 < N, d.1 < M, maze[d.0][d.1] {
            if visit[d.0][d.1] == 0 {
                visit[d.0][d.1] = visit[first.0][first.1] + 1
                queue.append(d)
            }
        }
    }
}

print(visit[N - 1][M - 1])
