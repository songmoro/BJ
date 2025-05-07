//
//  2178-3.swift
//  BJ
//
//  Created by 송재훈 on 5/7/25.
//


//4 6
//101111
//101010
//101011
//111011

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0]
let M = NM[1]

var board = [[Bool]]()
for _ in 0..<N { board.append(readLine()!.map { String($0) == "1" }) }
var visited = [[Int]](repeating: [Int](repeating: Int.max, count: M), count: N)
visited[0][0] = 1
var queue = [(0, 0)]
var i = 0

while i < queue.count {
    let (x, y) = queue[i]
    i += 1
    
    for d in 0...3 {
        let nx = x + dx[d]
        let ny = y + dy[d]
        
        if 0 <= nx, nx < N, 0 <= ny, ny < M, board[nx][ny], visited[nx][ny] > visited[x][y] + 1 {
            visited[nx][ny] = visited[x][y] + 1
            queue.append((nx, ny))
        }
    }
}

print(visited[N - 1][M - 1])
