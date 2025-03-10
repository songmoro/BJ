////
////  2240.swift
////  BJ
////
////  Created by 송재훈 on 10/7/24.
////
//
//
//let (T, W): (Int, Int) = {
//    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//    return (input[0], input[1])
//}()
//
//let plums: [Int] = [0] + (1...T).map { _ in Int(readLine()!)! }
//var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 3), count: 35), count: 1005)
//
//for i in 1...T {
//    dp[i][0][1] = dp[i - 1][0][1] + (plums[i] == 1 ? 1 : 0)
//    
//    for j in 1...W {
//        if plums[i] == 1 {
//            dp[i][j][1] = max(dp[i - 1][j - 1][2], dp[i - 1][j][1]) + 1
//            dp[i][j][2] = max(dp[i - 1][j - 1][1], dp[i - 1][j][2])
//
//        }
//        else {
//            dp[i][j][1] = max(dp[i - 1][j - 1][2], dp[i - 1][j][1])
//            dp[i][j][2] = max(dp[i - 1][j - 1][1], dp[i - 1][j][2]) + 1
//        }
//    }
//}
//
//print((dp[T].max { $0.max()! < $1.max()! })!.max()!)
//
////
////1 -> 1
////움직이지 않는 경우
////
////2 -> 1
////움직이는 경우
////1 -> 2
////움직이는 경우
////2 -> 2
////움직이지 않는 경우
////8 1
////2
////2
////2
////2
////1
////2
////1
////2
