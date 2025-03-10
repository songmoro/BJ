////
////  1463.swift
////  BJ
////
////  Created by 송재훈 on 9/27/24.
////
//
//
//let N = Int(readLine()!)!
//var dp = [Int](repeating: 0, count: 1000001)
//var i = 2
//
//while i <= N {
//    dp[i] = dp[i - 1] + 1
//    if i % 3 == 0 { dp[i] = min(dp[i], dp[i / 3] + 1) }
//    if i % 2 == 0 { dp[i] = min(dp[i], dp[i / 2] + 1) }
//    
//    i += 1
//}
//
//print(dp[N])
