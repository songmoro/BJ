//
//  9655-2.swift
//  BJ
//
//  Created by 송재훈 on 3/17/25.
//


//5

// MARK: 풀이
// 게임이론 + dp
// 돌을 1개 혹은 3개씩만 가져갈 수 있음.
// SK가 이기려면: i - 1 또는 i - 3 개에서 CY의 차례가 되어야 함.
// -> 그래야 자기 턴에 돌을 가져감
// dp[i - 1] == CY || dp[i - 3] == CY 이면 dp[i] = SK

let N = Int(readLine()!)!
var dp = [Bool](repeating: false, count: N + 3)
for i in stride(from: N, through: 1, by: -2) { dp[i] = true }

print((dp[1] || dp[3]) ? "SK" : "CY")
