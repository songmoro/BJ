//
//  2748.swift
//  BJ
//
//  Created by 송재훈 on 2/14/25.
//


//10
//55

let N = Int(readLine()!)!
var dp: [Int] = .init(repeating: 0, count: N + 2)
dp[1] = 1

if N >= 2 {
    for i in 2...N { dp[i] = dp[i - 1] + dp[i - 2] }
}

print(dp[N])
