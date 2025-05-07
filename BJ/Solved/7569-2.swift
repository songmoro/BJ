//
//  7569-2.swift
//  BJ
//
//  Created by 송재훈 on 5/7/25.
//


//5 3 1
//0 -1 0 0 0
//-1 -1 0 1 1
//0 0 0 1 1

let dx = [0, 0, -1, 1, 0, 0]
let dy = [0, 0, 0, 0, -1, 1]
let dh = [-1, 1, 0, 0, 0, 0]

let MNH = readLine()!.split(separator: " ").map { Int(String($0))! }
let (M, N, H) = (MNH[0], MNH[1], MNH[2])
var board = [[[Int]]]()
var distance = Array(repeating: Array(repeating: Array(repeating: -1, count: M), count: N), count: H)
var tomato = [(Int, Int, Int)]()
var total = 0

for h in 0..<H {
    var box = [[Int]]()
    
    for i in 0..<N {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        
        for j in 0..<M {
            if row[j] == 1 {
                tomato.append((i, j, h))
                distance[h][i][j] = 0
            }
            else if row[j] == 0 {
                total += 1
            }
        }
        
        box.append(row)
    }
    
    board.append(box)
}

var i = 0
var answer = 0
var current = 0

while i < tomato.count {
    let (x, y, h) = tomato[i]
    i += 1
    
    for d in 0...5 {
        let nx = x + dx[d]
        let ny = y + dy[d]
        let nh = h + dh[d]
        
        if 0..<N ~= nx, 0..<M ~= ny, 0..<H ~= nh, board[nh][nx][ny] == 0, distance[nh][nx][ny] == -1 {
            distance[nh][nx][ny] = distance[h][x][y] + 1
            tomato.append((nx, ny, nh))
            current += 1
            answer = distance[nh][nx][ny]
        }
    }
}

print(current == total ? answer : -1)
