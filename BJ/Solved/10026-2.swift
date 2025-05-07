//
//  10026-2.swift
//  BJ
//
//  Created by 송재훈 on 5/7/25.
//


//5
//RRRBB
//GGBBB
//BBBRR
//BBRRR
//RRRRR

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

let N = Int(readLine()!)!
var board = [[String]]()
var visitedR = Array(repeating: Array(repeating: false, count: N), count: N)
var visitedG = Array(repeating: Array(repeating: false, count: N), count: N)

for _ in 0..<N { board.append(readLine()!.map { String($0) })}

var R = 0
var G = 0

func bfs(_ i: Int, _ j: Int, _ isR: Bool) {
    if isR { visitedR[i][j] = true }
    else { visitedG[i][j] = true }
    
    var stack = [(i, j)]
    
    while !stack.isEmpty {
        let (x, y) = stack.removeLast()
        
        for d in 0...3 {
            let nx = x + dx[d]
            let ny = y + dy[d]
            
            if 0..<N ~= nx, 0..<N ~= ny {
                if isR {
                    if !visitedR[nx][ny], board[nx][ny] == board[i][j] {
                        visitedR[nx][ny] = true
                        stack.append((nx, ny))
                    }
                }
                else {
                    if !visitedG[nx][ny], (board[nx][ny] == "R" && board[i][j] == "G") || (board[nx][ny] == "G" && board[i][j] == "R") || (board[nx][ny] == board[i][j]) {
                        visitedG[nx][ny] = true
                        stack.append((nx, ny))
                    }
                }
            }
        }
    }
}

for i in 0..<N {
    for j in 0..<N {
        if !visitedR[i][j] {
            R += 1
            bfs(i, j, true)
        }
        if !visitedG[i][j] {
            G += 1
            bfs(i, j, false)
        }
    }
}

print(R, G)
