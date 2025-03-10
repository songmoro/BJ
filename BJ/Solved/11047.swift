////
////  11047.swift
////  BJ
////
////  Created by 송재훈 on 9/28/24.
////
//
//
//let input1 = readLine()!.split(separator: " ").map { Int(String($0))! }
//var (N, K) = (input1[0], input1[1])
//
//let coins: [Int] = (1...N).map { _ in Int(readLine()!)! }
//var result = 0
//
//for coin in coins.reversed() where K >= coin {
//    (result, K) = (result + (K / coin), K - (coin * (K / coin)))
//}
//
//print(result)
