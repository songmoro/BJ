////
////  11057.swift
////  BJ
////
////  Created by 송재훈 on 10/7/24.
////
//
//
//let N = Int(readLine()!)!
//
//var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 1002)
//for i in 0...9 { dp[1][i] = 1 }
//
//for i in 2...1000 {
//    for j in 0...9 {
//        for k in j...9 {
//            dp[i][j] += dp[i - 1][k] % 10007
//        }
//    }
//}
//
//print(dp[N].reduce(0, { ($0 + $1) % 10007 }))
