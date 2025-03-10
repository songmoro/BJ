//
//  11048.swift
//  BJ
//
//  Created by 송재훈 on 1/23/25.
//


//3 4
//1 2 3 4
//0 0 0 5
//9 8 7 6

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }

var maze: [[Int]] = []

for _ in 0..<NM[0] {
    maze.append(readLine()!.split(separator: " ").map({ Int(String($0))! }))
}

for i in 0..<NM[0] {
    for j in 0..<NM[1] {
        if (i, j) == (0, 0) {
            continue
        }
        
        if 0 > (i - 1) {
            maze[i][j] += maze[i][j - 1]
        }
        else if 0 > (j - 1) {
            maze[i][j] += maze[i - 1][j]
        }
        else {
            maze[i][j] += max(maze[i - 1][j], maze[i][j - 1], maze[i - 1][j - 1])
        }
    }
}

print(maze[NM[0] - 1][NM[1] - 1])
