////
////  1003.swift
////  BJ
////
////  Created by 송재훈 on 9/29/24.
////
//
//
//let T = Int(readLine()!)!
//var (dp0, dp1) = ([Int](repeating: 0, count: 45), [Int](repeating: 0, count: 45))
//(dp0[0], dp0[1], dp1[0], dp1[1]) = (1, 0, 0 ,1)
//
//for i in 2...40 {
//    (dp0[i], dp1[i]) = (dp0[i - 2] + dp0[i - 1], dp1[i - 2] + dp1[i - 1])
//}
//
//for _ in 1...T {
//    let i = Int(readLine()!)!
//    print(dp0[i], dp1[i])
//}
