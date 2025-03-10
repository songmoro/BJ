//
//  2573-2.swift
//  BJ
//
//  Created by 송재훈 on 3/10/25.
//

let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])
var north = [[Int]]()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    north.append(input)
}

var day = 0

while true {
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
    var area = 0
    
    for i in 0..<N {
        for j in 0..<M where north[i][j] != 0 && !visit[i][j] {
            visit[i][j] = true
            
            area += 1
            var stack = [(i, j)]
            
            while !stack.isEmpty {
                let last = stack.removeLast()
                
                for move in moves {
                    let n = (last.0 + move.0, last.1 + move.1)
                    
                    if n.0 < 0 || n.1 < 0 || n.0 >= N || n.1 >= M { continue }
                    if visit[n.0][n.1] || north[n.0][n.1] == 0 { continue }
                    
                    visit[n.0][n.1] = true
                    stack.append(n)
                }
            }
        }
    }
    
    if area == 0 {
        print(0)
        break
    }
    else if area >= 2 {
        print(day)
        break
    }
    
    var melt = [(Int, Int)]()
    
    for i in 0..<N {
        for j in 0..<M where north[i][j] == 0 {
            for move in moves {
                let n = (i + move.0, j + move.1)
                
                if n.0 < 0 || n.1 < 0 || n.0 >= N || n.1 >= M { continue }
                if north[n.0][n.1] == 0 { continue }
                
                melt.append(n)
            }
        }
    }
    
    for n in melt {
        if north[n.0][n.1] != 0 {
            north[n.0][n.1] -= 1
        }
    }
    
    day += 1
}
