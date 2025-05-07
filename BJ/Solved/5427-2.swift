//
//  5427-2.swift
//  BJ
//
//  Created by 송재훈 on 5/7/25.
//


//5
//4 3
//####
//#*@.
//####
//7 6
//###.###
//#*#.#*#
//#.....#
//#.....#
//#..@..#
//#######
//7 4
//###.###
//#....*#
//#@....#
//.######
//5 5
//.....
//.***.
//.*@*.
//.***.
//.....
//3 3
//###
//#@#
//###

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
let T = Int(readLine()!)!

loop:
for _ in 0..<T {
    let WH = readLine()!.split(separator: " ").map { Int(String($0))! }
    let W = WH[0]
    let H = WH[1]
    var board = [[String]]()
    var fire = [(Int, Int)]()
    var SG = (0, 0)
    var visited = Array(repeating: Array(repeating: -1, count: W), count: H)
    var escape = Array(repeating: Array(repeating: -1, count: W), count: H)
    
    for i in 0..<H {
        let row = readLine()!.map { String($0) }
        
        for j in 0..<W {
            if row[j] == "*" {
                visited[i][j] = 0
                fire.append((i, j))
            }
            else if row[j] == "@" {
                SG = (i, j)
                escape[i][j] = 0
            }
        }
        
        board.append(row)
    }
    
    var fireIndex = 0
    while fireIndex < fire.count {
        let (x, y) = fire[fireIndex]
        fireIndex += 1
        
        for d in 0...3 {
            let nx = x + dx[d]
            let ny = y + dy[d]
            
            if 0..<H ~= nx, 0..<W ~= ny, board[nx][ny] != "#", visited[nx][ny] == -1 {
                visited[nx][ny] = visited[x][y] + 1
                fire.append((nx, ny))
            }
        }
    }
    
    var move = [SG]
    var SGIndex = 0
    
    while SGIndex < move.count {
        let (x, y) = move[SGIndex]
        SGIndex += 1
        
        for d in 0...3 {
            let nx = x + dx[d]
            let ny = y + dy[d]
            
            if 0 > nx || nx >= H || 0 > ny || ny >= W {
                print(escape[x][y] + 1)
                continue loop
            }
            if board[nx][ny] == ".", escape[nx][ny] == -1, visited[nx][ny] == -1 || visited[nx][ny] > escape[x][y] + 1 {
                escape[nx][ny] = escape[x][y] + 1
                move.append((nx, ny))
            }
        }
    }
    
    print("IMPOSSIBLE")
}
