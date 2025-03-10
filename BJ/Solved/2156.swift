//
//  File.swift
//  BJ
//
//  Created by 송재훈 on 10/7/24.
//


let N = Int(readLine()!)!
let wine: [Int] = [0] + (1...N).map { _ in Int(readLine()!)! }

var dp = [[Int]](repeating: [Int](repeating: 0, count: 10010), count: 3)

for i in 1...N {
    dp[0][i] = max(dp[0][i - 1], dp[1][i - 1], dp[2][i - 1])
    (dp[1][i], dp[2][i]) = (dp[0][i - 1] + wine[i], dp[1][i - 1] + wine[i])
}

print(max(dp[0][N], dp[1][N], dp[2][N]))
