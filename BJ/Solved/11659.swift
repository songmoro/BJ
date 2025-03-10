////
////  11659.swift
////  BJ
////
////  Created by 송재훈 on 9/29/24.
////
//
//
//let input1 = readLine()!.split(separator: " ").map { Int(String($0))! }
//let (N, M) = (input1[0], input1[1])
//
//let arr = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
//var dp = Array(repeating: 0, count: 100010)
//
//for i in 1...N {
//    dp[i] = dp[i - 1] + arr[i]
//}
//
//for _ in 0..<M {
//    let range = readLine()!.split(separator: " ").map { Int(String($0))! }
//    print(dp[range[1]] - dp[range[0] - 1])
//}
