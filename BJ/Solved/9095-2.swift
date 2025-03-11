//
//  9095-2.swift
//  BJ
//
//  Created by 송재훈 on 3/11/25.
//


//3
//4
//7
//10

// MARK: 문제 패턴
// dp[k] = 3 만드는 방법 + 2 만드는 방법 + 1 만드는 방법
//1+1+1+ 1 -> 3 만드는 방법
//1+2+ 1 -> 3 만드는 방법
//2+1+ 1 -> 3 만드는 방법
//3+ 1 -> 3 만드는 방법
//1+1+ 2 -> 2 만드는 방법
//2+2 -> 2 만드는 방법법
//1+3 -> 1 만드는 방법

let T = Int(readLine()!)!

var dp = [Int](repeating: Int.max, count: 12)
(dp[1], dp[2], dp[3]) = (1, 2, 4)

for i in 4...11 { dp[i] = dp[i - 3] + dp[i - 2] + dp[i - 1] }

for _ in 0..<T {
    let n = Int(readLine()!)!
    print(dp[n])
}
