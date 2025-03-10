////
////  2579.swift
////  BJ
////
////  Created by 송재훈 on 9/28/24.
////
//
//
//let N = Int(readLine()!)!
//var stairs = [0]
//for _ in 1...N {
//    stairs.append(Int(readLine()!)!)
//}
//
//if N <= 2 {
//    print(N == 1 ? stairs[1] : stairs[1] + stairs[2])
//}
//else {
//    var dp = Array(repeating: Array(repeating: 0, count: 305), count: 305)
//    
//    (dp[1][1], dp[1][2]) = (stairs[1], 0)
//    (dp[2][1], dp[2][2]) = (stairs[2], stairs[1] + stairs[2])
//    
//    for i in 3...N {
//        dp[i][1] = max(dp[i - 2][1], dp[i - 2][2]) + stairs[i]
//        dp[i][2] = dp[i - 1][1] + stairs[i]
//    }
//    
//    print(max(dp[N][2], dp[N][1]))
//}
