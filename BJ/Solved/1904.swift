////
////  1904.swift
////  BJ
////
////  Created by 송재훈 on 9/30/24.
////
//
//
//let N = Int(readLine()!)!
//
//if N <= 2 {
//    print(N)
//}
//else {
//    var dp = [Double](repeating: 0, count: 1000010)
//    (dp[1], dp[2]) = (1, 2)
//    
//    for i in 3...N { dp[i] = (dp[i - 2] + dp[i - 1]).truncatingRemainder(dividingBy: 15746) }
//    
//    print(Int(dp[N]))
//}
