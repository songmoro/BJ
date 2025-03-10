////
////  14501.swift
////  BJ
////
////  Created by 송재훈 on 9/30/24.
////
//
//
//let N = Int(readLine()!)!
//let schedule: [[Int]] = [[0, 0]] + (1...N).map { _ in
//    readLine()!.split(separator: " ").map { Int(String($0))! }
//}
//
//var dp = [Int](repeating: 0, count: 25)
//for i in (1...N).reversed() {
//    if N >= (schedule[i][0] + i - 1) {
//        dp[i] = max(dp[i + schedule[i][0]] + schedule[i][1], dp[i + 1])
//        continue
//    }
//    dp[i] = dp[i + 1]
//}
//
//print(dp.max()!)
//
