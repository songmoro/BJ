//
//  4179-2.swift
//  BJ
//
//  Created by 송재훈 on 5/7/25.
//


//4 4
//####
//#JF#
//#..#
//#..#


let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

let input = readLine()!.split(separator: " ").map { Int($0)! }
let R = input[0]
let C = input[1]

var board = [[Character]]()
var fireTime = Array(repeating: Array(repeating: Int.max, count: C), count: R)
var jihunTime = Array(repeating: Array(repeating: Int.max, count: C), count: R)

var fireQueue = [(Int, Int)]()
var jihunQueue = [(Int, Int)]()

for i in 0..<R {
    let row = Array(readLine()!)
    board.append(row)
    for j in 0..<C {
        if row[j] == "F" {
            fireQueue.append((i, j))
            fireTime[i][j] = 0
        } else if row[j] == "J" {
            jihunQueue.append((i, j))
            jihunTime[i][j] = 0
        }
    }
}

var fireIndex = 0
while fireIndex < fireQueue.count {
    let (x, y) = fireQueue[fireIndex]
    fireIndex += 1

    for dir in 0..<4 {
        let nx = x + dx[dir]
        let ny = y + dy[dir]

        if 0 <= nx && nx < R && 0 <= ny && ny < C {
            if board[nx][ny] != "#" && fireTime[nx][ny] == Int.max {
                fireTime[nx][ny] = fireTime[x][y] + 1
                fireQueue.append((nx, ny))
            }
        }
    }
}

var jihunIndex = 0
var escaped = false
var result = 0

loop:
while jihunIndex < jihunQueue.count {
    let (x, y) = jihunQueue[jihunIndex]
    jihunIndex += 1

    for dir in 0..<4 {
        let nx = x + dx[dir]
        let ny = y + dy[dir]

        if nx < 0 || nx >= R || ny < 0 || ny >= C {
            result = jihunTime[x][y] + 1
            escaped = true
            break loop
        }

        if board[nx][ny] != "#" && jihunTime[nx][ny] == Int.max {
            if fireTime[nx][ny] == Int.max || jihunTime[x][y] + 1 < fireTime[nx][ny] {
                jihunTime[nx][ny] = jihunTime[x][y] + 1
                jihunQueue.append((nx, ny))
            }
        }
    }
}

print(escaped ? result : "IMPOSSIBLE")
