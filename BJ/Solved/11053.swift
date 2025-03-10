//
//  11053.swift
//  BJ
//
//  Created by 송재훈 on 2/13/25.
//


//6
//10 20 10 30 20 50
//
let N = Int(readLine()!)!
let seq = readLine()!.split(separator: " ").map({ Int($0)! })

var dp: [Int] = .init(repeating: 1, count: N)

for i in 0..<N {
    for j in 0..<i where seq[j] < seq[i] {
        dp[i] = max(dp[i], dp[j] + 1)
    }
}

print(dp.max()!)

//
//  10 20 10 30 20 50
//0  1  1  1  1  1  1 -> 초기
//1  1  1  1  1  1  1 -> 10은 이미 10을 포함
//2  1  2  1  1  1  1 -> 10 < 10 이기 때문에 dp[1] = max(dp[1], dp[0] + 1) -> 2
//3  1  2  1  1  1  1 -> 10보다 작은 값이 없음
//4  1  2  1  3  1  1 -> 1. dp[3] = max(dp[3], dp[0] + 1) -> 2, dp[3] = max(dp[3], dp[1] + 1) -> 3
//5  1  2  1  3  2  1 -> 1. dp[4] = max(dp[4], dp[0] + 1) -> 2, dp[4] = max(dp[4], dp[2] + 1) -> 2
//6  1  2  1  3  2  4
