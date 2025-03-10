////
////  10844.swift
////  BJ
////
////  Created by 송재훈 on 10/7/24.
////
//
//
//import Foundation
//
//var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 101)
//for i in 1...9 { dp[1][i] = 1 }
//
//for i in 2...100 {
//    (dp[i][0], dp[i][9]) = (dp[i - 1][1] % 1000000000, dp[i - 1][8] % 1000000000)
//    for j in 1...8 { dp[i][j] = (dp[i - 1][j - 1] + dp[i - 1][j + 1] % 1000000000) }
//}
//
////let N = Int(readLine()!)!
//for N in 1...100 {
//    let result = (0...9).reduce(0) {
//        ($0 + dp[N][$1]) % 1000000000
//    }
//    print(result)
//}
