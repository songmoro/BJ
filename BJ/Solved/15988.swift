////
////  15988.swift
////  BJ
////
////  Created by 송재훈 on 9/30/24.
////
//
//
//let T = Int(readLine()!)!
//var dp = [Double](repeating: 0, count: 1000010)
//var max = 3
//
//(dp[1], dp[2], dp[3]) = (1, 2, 4)
//
//for _ in 1...T {
//    let n = Int(readLine()!)!
//    
//    if max < n {
//        for i in (max + 1)...n {
//            dp[i] = (dp[i - 3] + dp[i - 2] + dp[i - 1]).truncatingRemainder(dividingBy: 1000000009)
//        }
//        
//        max = n
//    }
//    
//    print(Int(dp[n]))
//}
