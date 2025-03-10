//
//  1890.swift
//  BJ
//
//  Created by 송재훈 on 1/23/25.
//


//4
//2 3 3 1
//1 2 1 3
//1 2 3 1
//3 1 1 0

let N = Int(readLine()!)!

if N == 1 {
    print(1)
}
else {
    var gameBoards: [[Int]] = []
    
    for _ in 0..<N {
        gameBoards.append(readLine()!.split(separator: " ").map({ Int(String($0))! }))
    }
    
    var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: N), count: N)
    dp[0][0] = 1
    
    for i in 0..<N {
        for j in 0..<N {
            let d = gameBoards[i][j]
            
            if d == 0 || dp[i][j] == 0 || (i, j) == (N - 1, N - 1) {
                continue
            }
            
            if N > (i + d) { dp[i + d][j] += dp[i][j] }
            if N > (j + d) { dp[i][j + d] += dp[i][j] }
        }
    }
    
    print(dp[N - 1][N - 1])
}
