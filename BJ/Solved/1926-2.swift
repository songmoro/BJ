//
//  1926-2.swift
//  BJ
//
//  Created by 송재훈 on 3/9/25.
//


//6 5
//1 1 0 1 1
//0 1 1 0 0
//0 0 0 0 0
//1 0 1 1 1
//0 0 1 1 1
//0 0 1 1 1

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])

var paper = [[Int]]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    paper.append(input)
}

var drawCount = 0
var maxSize = 0
let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var visit = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

for i in 0..<n {
    for j in 0..<m where paper[i][j] == 1 && !visit[i][j] {
        var queue = [(i, j)]
        var index = 0
        var size = 1
        visit[i][j] = true
        
        while index < queue.count {
            let first = queue[index]
            index += 1
            
            for move in moves {
                let next = (move.0 + first.0, move.1 + first.1)
                
                if next.0 >= 0, next.1 >= 0, next.0 < n, next.1 < m, !visit[next.0][next.1], paper[next.0][next.1] == 1 {
                    visit[next.0][next.1] = true
                    queue.append(next)
                    size += 1
                }
            }
        }
        
        maxSize = max(maxSize, size)
        drawCount += 1
    }
}

print(drawCount)
print(maxSize)
