////
////  1149.swift
////  BJ
////
////  Created by 송재훈 on 9/28/24.
////
//
//
//let N = Int(readLine()!)!
//var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 3), count: 1010)
//
//let cost: [[Int]] = [[0, 0, 0]] + (1...N).map { _ in
//    readLine()!.split(separator: " ").map({ Int(String($0))! })
//}
//
//for i in 1...N {
//    dp[i][0] = min(dp[i - 1][1], dp[i - 1][2]) + cost[i][0]
//    dp[i][1] = min(dp[i - 1][0], dp[i - 1][2]) + cost[i][1]
//    dp[i][2] = min(dp[i - 1][0], dp[i - 1][1]) + cost[i][2]
//}
//
//print(dp[N].min()!)
