//
//  2583-3.swift
//  BJ
//
//  Created by 송재훈 on 5/8/25.
//


//5 7 3
//0 2 4 4
//1 1 2 5
//4 0 6 2

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

let MNK = readLine()!.split(separator: " ").map { Int(String($0))! }
let M = MNK[0], N = MNK[1], K = MNK[2]
var board = Array(repeating: Array(repeating: false, count: N), count: M)
var visited = board

for _ in 0..<K {
    let X1Y1X2Y2 = readLine()!.split(separator: " ").map { Int(String($0))! }
    let X1 = X1Y1X2Y2[0], Y1 = X1Y1X2Y2[1], X2 = X1Y1X2Y2[2], Y2 = X1Y1X2Y2[3]
    
    for x in X1..<X2 {
        for y in Y1..<Y2 {
            board[y][x] = true
        }
    }
}

var answer = [Int]()
for i in 0..<M {
    for j in 0..<N {
        if !board[i][j], !visited[i][j] {
            var current = 1
            visited[i][j] = true
            var stack = [(i, j)]
            
            while !stack.isEmpty {
                let (x, y) = stack.removeLast()
                
                for d in 0...3 {
                    let nx = x + dx[d], ny = y + dy[d]
                    
                    if 0..<M ~= nx, 0..<N ~= ny, !board[nx][ny], !visited[nx][ny] {
                        visited[nx][ny] = true
                        current += 1
                        stack.append((nx, ny))
                    }
                }
            }
            
            answer.append(current)
        }
    }
}

print(answer.count)
print(answer.sorted().map(String.init).joined(separator: " "))
