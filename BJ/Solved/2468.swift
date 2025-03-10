//
//  2468.swift
//  BJ
//
//  Created by 송재훈 on 3/10/25.
//


//5
//6 8 2 6 2
//3 2 3 4 6
//6 7 3 3 2
//7 2 5 3 6
//8 9 5 2 7

let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let N = Int(readLine()!)!

var ground = [[Int]]()
var maxHeight = -1

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    maxHeight = max(input.max()!, maxHeight)
    
    ground.append(input)
}

var safeArea = 0

for height in 0...maxHeight {
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    var area = 0
    
    for i in 0..<N {
        for j in 0..<N where !visit[i][j] && height < ground[i][j] {
            visit[i][j] = true
            area += 1
            var stack = [(i, j)]
            
            while !stack.isEmpty {
                let last = stack.removeLast()
                
                for move in moves {
                    let n = (last.0 + move.0, last.1 + move.1)
                    
                    if n.0 < 0 || n.1 < 0 || n.0 >= N || n.1 >= N { continue }
                    if visit[n.0][n.1] || height >= ground[n.0][n.1] { continue }
                    
                    visit[n.0][n.1] = true
                    stack.append(n)
                }
            }
        }
    }
    
    safeArea = max(area, safeArea)
}

print(safeArea)
