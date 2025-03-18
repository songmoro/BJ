//
//  9657.swift
//  BJ
//
//  Created by 송재훈 on 3/18/25.
//


//6
// MARK: 1, 3, 4개
// -> 창영이 하나라도 지는 경우가 있으면(i - 1, i - 3, i - 4), 상근의 승리
// --> !dp[i - 4] || !dp[i - 3] || !dp[i - 1] -> 상근이 이기는 케이스가 하나라도 있으면 이김

let N = Int(readLine()!)!
var dp = [false, true, false, true, true] + [Bool](repeating: false, count: N + 10)
var flag = true

for i in 5...(N + 5) where !dp[i - 4] || !dp[i - 3] || !dp[i - 1] {
    dp[i] = true
}

print(dp[N] ? "SK" : "CY")

//
//7
//ans : CY
//
//9
//ans : CY
//
//30
//ans : CY
//
//35
//ans : CY

