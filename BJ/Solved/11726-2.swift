//
//  11726-2.swift
//  BJ
//
//  Created by 송재훈 on 3/11/25.
//


//9

let N = Int(readLine()!)!
var dp = [Int](repeating: 0, count: N + 3)
(dp[1], dp[2]) = (1, 2)

for i in 3...(N + 2) { dp[i] = (dp[i - 2] + dp[i - 1]) % 10007 }

print(dp[N])
