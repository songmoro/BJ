//
//  2178-2.swift
//  BJ
//
//  Created by 송재훈 on 3/9/25.
//


//4 6
//101111
//101010
//101011
//111011

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])

var maze = [[Bool]]()

for _ in 0..<N {
    let input = readLine()!.map { String($0) == "1" }
    maze.append(input)
}

var distance: [[Int]] = .init(repeating: .init(repeating: -1, count: M), count: N)
distance[0][0] = 1

let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var queue = [(0, 0)]
var index = 0

while index < queue.count {
    let first = queue[index]
    index += 1
    
    for move in moves {
        let next = (move.0 + first.0, move.1 + first.1)
        
        if next.0 >= 0, next.1 >= 0, next.0 < N, next.1 < M, maze[next.0][next.1], distance[next.0][next.1] == -1 {
            distance[next.0][next.1] = distance[first.0][first.1] + 1
            queue.append(next)
        }
    }
}

print(distance[N - 1][M - 1])
