//
//  2667-3.swift
//  BJ
//
//  Created by 송재훈 on 5/8/25.
//


//7
//0110100
//0110101
//1110101
//0000111
//0100000
//0111110
//0111000

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

let N = Int(readLine()!)!
var board = [[Bool]]()
var visited = Array(repeating: Array(repeating: false, count: N), count: N)
for _ in 0..<N { board.append(readLine()!.map({ String($0) == "1" })) }

var answer = [Int]()

for i in 0..<N {
    for j in 0..<N {
        if board[i][j], !visited[i][j] {
            var current = 1
            visited[i][j] = true
            var stack = [(i, j)]
            
            while !stack.isEmpty {
                let (x, y) = stack.removeLast()
                
                for d in 0...3 {
                    let nx = x + dx[d]
                    let ny = y + dy[d]
                    
                    if 0..<N ~= nx, 0..<N ~= ny, !visited[nx][ny], board[nx][ny] {
                        stack.append((nx, ny))
                        visited[nx][ny] = true
                        current += 1
                    }
                }
            }
            
            answer.append(current)
        }
    }
}

print(answer.count)
print(answer.sorted().map({ String($0) + "\n" }).joined())
