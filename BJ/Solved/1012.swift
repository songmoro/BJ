//
//  1012.swift
//  BJ
//
//  Created by 송재훈 on 3/10/25.
//


//2
//10 8 17
//0 0
//1 0
//1 1
//4 2
//4 3
//4 5
//2 4
//3 4
//7 4
//8 4
//9 4
//7 5
//8 5
//9 5
//7 6
//8 6
//9 6
//10 10 1
//5 5

let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var T = Int(readLine()!)!

while T != 0 {
    T -= 1
    
    let MNK = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (M, N, K) = (MNK[0], MNK[1], MNK[2])
    
    var farm = [[Bool]](repeating: [Bool](repeating: false, count: N), count: M)
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: N), count: M)
    for _ in 0..<K {
        let XY = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (X, Y) = (XY[0], XY[1])
        
        farm[X][Y] = true
    }
    
    var worms = 0
    
    for i in 0..<M {
        for j in 0..<N where farm[i][j] && !visit[i][j] {
            var stack = [(i, j)]
            worms += 1
            
            while !stack.isEmpty {
                let last = stack.removeLast()
                
                for move in moves {
                    let n = (last.0 + move.0, last.1 + move.1)
                    
                    if n.0 >= 0, n.1 >= 0, n.0 < M, n.1 < N, farm[n.0][n.1], !visit[n.0][n.1] {
                        stack.append(n)
                        visit[n.0][n.1] = true
                    }
                }
            }
        }
    }
    
    print(worms)
}
