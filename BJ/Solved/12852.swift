////
////  12852.swift
////  BJ
////
////  Created by 송재훈 on 9/29/24.
////
//
//
//let N = Int(readLine()!)!
//
//if N == 1 {
//    print(0)
//    print(1)
//}
//else {
//    var (dp, path) = ([Int](repeating: 0, count: 1000010), [Int](repeating: 0, count: 1000010))
//    
//    for i in 2...N {
//        (dp[i], path[i]) = (dp[i - 1] + 1, i - 1)
//        
//        if i % 3 == 0, dp[i] > (dp[i / 3] + 1) { (dp[i], path[i]) = (dp[i / 3] + 1, i / 3) }
//        if i % 2 == 0, dp[i] > (dp[i / 2] + 1) { (dp[i], path[i]) = (dp[i / 2] + 1, i / 2) }
//    }
//    
//    print(dp[N], "\n", N, separator: "", terminator: " ")
//
//    var i = N
//    while i != 1 {
//        print(path[i], terminator: " ")
//        i = path[i]
//    }
//}
