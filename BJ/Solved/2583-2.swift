//
//  2583-2.swift
//  BJ
//
//  Created by 송재훈 on 3/10/25.
//


//5 7 3
//0 2 4 4
//1 1 2 5
//4 0 6 2

let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let MNK = readLine()!.split(separator: " ").map { Int(String($0))! }
let (M, N, K) = (MNK[0], MNK[1], MNK[2])

var paper = [[Bool]](repeating: [Bool](repeating: false, count: N), count: M)

for _ in 0..<K {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (x1, y1, x2, y2) = (input[0], input[1], input[2], input[3])
    
    for i in y1..<y2 {
        for j in x1..<x2 {
            paper[i][j] = true
        }
    }
}

var sectors = [Int]()
var visit = [[Bool]](repeating: [Bool](repeating: false, count: N), count: M)

for i in 0..<M {
    for j in 0..<N where !paper[i][j] && !visit[i][j] {
        visit[i][j] = true
        var stack = [(i, j)]
        var sector = 1
        
        while !stack.isEmpty {
            let last = stack.removeLast()
            
            for move in moves {
                let n = (last.0 + move.0, last.1 + move.1)
                
                if n.0 < 0 || n.1 < 0 || n.0 >= M || n.1 >= N {
                    continue
                }
                if paper[n.0][n.1] || visit[n.0][n.1] {
                    continue
                }
                
                sector += 1
                visit[n.0][n.1] = true
                stack.append(n)
            }
        }
        
        sectors.append(sector)
    }
}

print(sectors.count)
print(sectors.sorted().map({ String($0) }).joined(separator: " "))
