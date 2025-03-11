//
//  1463-2.swift
//  BJ
//
//  Created by 송재훈 on 3/11/25.
//


//2

let N = Int(readLine()!)!
var dp = [Int](repeating: Int.max, count: 1000001)
(dp[0], dp[1]) = (-1, 0)

if N == 1 { print(0) }
else {
    for i in 2...N {
        if i % 3 == 0 { dp[i] = min(dp[i], dp[i / 3] + 1) }
        if i % 2 == 0 { dp[i] = min(dp[i], dp[i / 2] + 1) }
        dp[i] = min(dp[i], dp[i - 1] + 1)
    }
    
    print(dp[N])
}
