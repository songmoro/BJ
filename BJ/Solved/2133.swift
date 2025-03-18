//
//  2133.swift
//  BJ
//
//  Created by 송재훈 on 3/17/25.
//


// 2

// MARK: 3 * n 크기 타일 채우는 방법
// -> 매 타일마다 새로운 2가지 방법이 추가됨
// -> (2칸 단위 매 타일을 채우는 방법...) + 2
// 타일은 2 * 1, 1 * 2
// 3 * 2를 채우는 방법은 3가지
// 3 * 4를 채우는 방법은 11가지, (3 * 2를 채우는 방법 * 3) + (3 * 4를 채우는 방법)
// 3 * 6를 채우는 방법은 41가지, (3 * 2를 채우는 방법 * 2) + (3 * 4를 채우는 방법 * 3) + (3 * 6를 채우는 방법)
//                        -> 3 * 3 + 11 * 3 + 2 -> 6 + 33 + 2 = 41
// 3 * 8를 채우는 방법 -> (3 * 6를 채우는 방법 * 3 * 2를 채우는 방법) + (3 * 4를 채우는 방법 * 2) + (3 * 2를 채우는 방법 * 2) + (3 * 8를 채우는 방법)

let N = Int(readLine()!)!

if N % 2 == 1 { print(0) }
else {
    var dp = [0, 0, 3, 0, 11, 0, 41, 0] + [Int](repeating: 0, count: N + 1)
    for i in stride(from: 8, through: dp.count, by: 2) { dp[i] = 4 * dp[i - 2] - dp[i - 4] }
    
    print(dp[N])
}

//let N = Int(readLine()!)!
//
//if N % 2 == 1 { print(0) } else {
//    var dp = [Int](repeating: 0, count: N + 1) { willSet { print(newValue) } }
//    dp[0] = 1
//    dp[2] = 3
//    
//    if N >= 4 {
//        for i in stride(from: 4, through: N, by: 2) {
//            dp[i] = 3 * dp[i - 2]
//            
//            for j in stride(from: 4, through: i, by: 2) {
//                dp[i] += 2 * dp[i - j]
//            }
//        }
//    }
//    
//    print(dp[N])
//}
