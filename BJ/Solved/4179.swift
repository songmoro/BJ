//
//  4179.swift
//  BJ
//
//  Created by 송재훈 on 3/9/25.
//


//4 4
//####
//#JF#
//#..#
//#..#

let RC = readLine()!.split(separator: " ").map { Int(String($0))! }
let (R, C) = (RC[0], RC[1])

var maze = [[String]]()
var jihoon = (0, 0)
var fire = [(Int, Int)]()

var burn = [[Int]](repeating: [Int](repeating: -1, count: C), count: R)
var escape = [[Int]](repeating: [Int](repeating: -1, count: C), count: R)

for i in 0..<R {
    let input = readLine()!.map { String($0) }
    
    for j in 0..<C {
        if input[j] == "F" {
            fire.append((i, j))
            burn[i][j] = 0
        }
        else if input[j] == "." || input[j] == "#" {
            continue
        }
        else {
            jihoon = (i, j)
            escape[i][j] = 0
        }
    }
    
    maze.append(input)
}

let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]

var queue = fire
var index = 0

while index < queue.count {
    let first = queue[index]
    index += 1
    
    for move in moves {
        let n = (first.0 + move.0, first.1 + move.1)
        
        if n.0 >= 0, n.1 >= 0, n.0 < R, n.1 < C, maze[n.0][n.1] != "#", burn[n.0][n.1] == -1 {
            queue.append(n)
            burn[n.0][n.1] = burn[first.0][first.1] + 1
        }
    }
}

queue = [jihoon]
index = 0

var answer = -1

while index < queue.count {
    let first = queue[index]
    index += 1
    
    if first.0 == 0 || first.1 == 0 || first.0 == R - 1 || first.1 == C - 1 {
        answer = escape[first.0][first.1] + 1
        break
    }
    
    for move in moves {
        let n = (first.0 + move.0, first.1 + move.1)
        
        if n.0 >= 0, n.1 >= 0, n.0 < R, n.1 < C, maze[n.0][n.1] == ".", escape[n.0][n.1] == -1 {
            if burn[n.0][n.1] != -1, burn[n.0][n.1] <= escape[first.0][first.1] + 1 {
                continue
            }
            
            queue.append(n)
            escape[n.0][n.1] = escape[first.0][first.1] + 1
        }
    }
}

print(answer == -1 ? "IMPOSSIBLE" : answer)

//3 3
//###
//#J#
//#.#
// 2

//2 2
//##
//JF

//6 7
//###.###
//#F#.#F#
//#.....#
//#.....#
//#..J..#
//#######

//3 5
//#####
//#J...
//F.#..
