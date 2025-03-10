////
////  9465.swift
////  BJ
////
////  Created by 송재훈 on 10/8/24.
////
//
//
//var T = Int(readLine()!)!
//
//while T != 0 {
//    T -= 1
//    
//    let n = Int(readLine()!)!
//    let sticker: [[Int]] = (0...1).map { _ in readLine()!.split(separator: " ").map { Int(String($0))! } }
//    var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 5), count: 2)
//    (dp[0][0], dp[1][0]) = (sticker[0][0], sticker[1][0])
//    
//    if n != 1 {
//        (dp[0][1], dp[1][1]) = (dp[1][0] + sticker[0][1], dp[0][0] + sticker[1][1])
//        
//        for i in 2..<n {
//            dp[0][i] = max(dp[1][i - 1], dp[1][i - 2]) + sticker[0][i]
//            dp[1][i] = max(dp[0][i - 1], dp[0][i - 2]) + sticker[1][i]
//        }
//    }
//    
//    print(max(dp[0][n - 1], dp[1][n - 1]))
//}
//
////2
////5
////50 10 100 20 40
////30 50 70 10 60
////7
////10 30 10 50 100 20 40
////20 40 30 50 60 20 80
