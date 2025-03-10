////
////  11052.swift
////  BJ
////
////  Created by 송재훈 on 10/7/24.
////
//
//
//let N = Int(readLine()!)!
//var dp = [0] + readLine()!.split(separator: " ").map({ Int(String($0))! })
//
//for i in 1...N {
//    dp[i] = (1...i).map { j in
//        if i % j == 0 {
//            return dp[j] * (i / j)
//        }
//        else {
//            return dp[j] + dp[i - j]
//        }
//    }.max()!
//}
//
//print(dp[N])
