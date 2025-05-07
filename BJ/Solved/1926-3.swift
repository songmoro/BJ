//
//  1926-3.swift
//  BJ
//
//  Created by 송재훈 on 5/7/25.
//


//6 5
//1 1 0 1 1
//0 1 1 0 0
//0 0 0 0 0
//1 0 1 1 1
//0 0 1 1 1
//0 0 1 1 1

//4
//9

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])

var board = [[Bool]]()
for _ in 0..<n { board.append(readLine()!.split(separator: " ").map { $0 == "1" }) }

var answer = [Int]()

for i in 0..<n {
    for j in 0..<m where board[i][j] {
        var stack = [(i, j)]
        var count = 1
        board[i][j] = false
        
        while !stack.isEmpty {
            let (x, y) = stack.removeLast()
            
            for d in 0...3 {
                let (nx, ny) = (x + dx[d], y + dy[d])
                
                if 0 <= nx, nx < n, 0 <= ny, ny < m, board[nx][ny] {
                    board[nx][ny] = false
                    count += 1
                    stack.append((nx, ny))
                }
            }
        }
        
        answer.append(count)
    }
}

print(answer.count)
print(answer.max() ?? 0)
