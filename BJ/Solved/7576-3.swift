//
//  7576-3.swift
//  BJ
//
//  Created by 송재훈 on 5/7/25.
//


//6 4
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 1

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let M = NM[0]
let N = NM[1]

var board = [[Int]]()
var visited = [[Int]](repeating: [Int](repeating: -1, count: M), count: N)
var tomato = [(Int, Int)]()
var i = 0
var total = 0

for i in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    for j in 0..<M {
        if row[j] == 1 {
            tomato.append((i, j))
            visited[i][j] = 0
        }
        if row[j] == 0 {
            total += 1
        }
    }
    
    board.append(row)
}

var answer = 0
var count = 0

while i < tomato.count {
    let (x, y) = tomato[i]
    i += 1
    
    for d in 0...3 {
        let nx = x + dx[d]
        let ny = y + dy[d]
        
        if 0 <= nx, nx < N, 0 <= ny, ny < M, board[nx][ny] == 0, visited[nx][ny] == -1 {
            visited[nx][ny] = visited[x][y] + 1
            tomato.append((nx, ny))
            answer = visited[nx][ny]
            count += 1
        }
    }
}

if total == count {
    print(answer)
}
else {
    print(-1)
}
