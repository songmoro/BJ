////
////  2193.swift
////  BJ
////
////  Created by 송재훈 on 9/30/24.
////
//
//
//let N = Int(readLine()!)!
//
//if N <= 2 {
//    print(1)
//}
//else {
//    var dp = [Int](repeating: 0, count: 91)
//    (dp[1], dp[2], dp[3]) = (1, 1, 2)
//
//    for i in 2...N {
//        dp[i] = dp[i - 2] + dp[i - 1]
//    }
//    
//    print(dp[N])
//}
