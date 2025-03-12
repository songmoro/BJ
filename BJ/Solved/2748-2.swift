//
//  2748-2.swift
//  BJ
//
//  Created by 송재훈 on 3/12/25.
//

let n = Int(readLine()!)!

var dp = [0, 1]
for i in 1...(n + 1) { dp.append(dp[i - 1] + dp[i]) }

print(dp[n])
