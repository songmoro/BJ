//
//  1003-2.swift
//  BJ
//
//  Created by 송재훈 on 3/11/25.
//


//3
//0
//1
//3

let T = Int(readLine()!)!
var dp = [[1, 0], [0, 1]] + [[Int]](repeating: [0, 0], count: 40)

for i in 2...40 {
    for j in 0...1 {
        dp[i][j] = dp[i - 2][j] + dp[i - 1][j]
    }
}

for _ in 0..<T {
    let N = Int(readLine()!)!
    print(dp[N][0], dp[N][1])
}
