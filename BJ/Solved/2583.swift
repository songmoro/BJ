//
//  2583.swift
//  BJ
//
//  Created by 송재훈 on 2/15/25.
//


//5 7 3
//0 2 4 4
//1 1 2 5
//4 0 6 2

let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]

let MNK = readLine()!.split(separator: " ").map({ Int($0)! })
let (M, N, K) = (MNK[0], MNK[1], MNK[2])
var paper: [[Bool]] = .init(repeating: .init(repeating: true, count: N), count: M)
var visited: [[Bool]] = .init(repeating: .init(repeating: false, count: N), count: M)

for _ in 0..<K {
    let rectangle = readLine()!.split(separator: " ").map({ Int($0)! })
    let (x1, y1, x2, y2) = (rectangle[0], rectangle[1], rectangle[2], rectangle[3])
    
    for i in x1..<x2 {
        for j in y1..<y2 {
            paper[j][i] = false
        }
    }
}

var answer = [Int]()

for i in 0..<M {
    for j in 0..<N where paper[i][j] && !visited[i][j] {
        var (size, queue) = (1, [(i, j)])
        visited[i][j] = true
        
        while !queue.isEmpty {
            let first = queue.removeFirst()
            
            for dir in dirs {
                let d = (first.0 + dir.0, first.1 + dir.1)
                
                if d.0 >= 0, d.1 >= 0, d.0 < M, d.1 < N, !visited[d.0][d.1], paper[d.0][d.1] {
                    size += 1
                    visited[d.0][d.1] = true
                    queue.append(d)
                }
            }
        }
        
        answer.append(size)
    }
}

print(answer.count)
print(answer.sorted().map({ String($0) }).joined(separator: " "))
