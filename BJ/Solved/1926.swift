//
//  1926.swift
//  BJ
//
//  Created by 송재훈 on 2/15/25.
//


//6 5
//1 1 0 1 1
//0 1 1 0 0
//0 0 0 0 0
//1 0 1 1 1
//0 0 1 1 1
//0 0 1 1 1

let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]

let nm = readLine()!.split(separator: " ").map({ Int($0)! })
let (n, m) = (nm[0], nm[1])

var paper = [[Bool]]()
var visited: [[Bool]] = .init(repeating: .init(repeating: false, count: m), count: n)

for _ in 0..<n {
    let read = readLine()!.split(separator: " ").map({ String($0) == "1" })
    paper.append(read)
}

var paintCount = 0
var maxArea = 0

for i in 0..<n {
    for j in 0..<m where paper[i][j] && !visited[i][j] {
        var queue = [(i, j)]
        paintCount += 1
        var partialArea = 1
        visited[i][j] = true
        
        while !queue.isEmpty {
            let first = queue.removeFirst()
            
            for dir in dirs {
                let d = (first.0 + dir.0, first.1 + dir.1)
                
                if d.0 >= 0, d.1 >= 0, d.0 < n, d.1 < m, !visited[d.0][d.1], paper[d.0][d.1] {
                    partialArea += 1
                    visited[d.0][d.1] = true
                    queue.append(d)
                }
            }
        }
        
        maxArea = max(maxArea, partialArea)
    }
}

print(paintCount)
print(maxArea)
