//
//  11052-2.swift
//  BJ
//
//  Created by 송재훈 on 3/14/25.
//

//4
//1 5 6 7

// MARK: 풀이
// N장의 카드를 구매하는 최대 비용 계산
// -> 만약 j개를 여러 장 구매할 수 있으면 -> P[i]와 P[j] * 여러장 중 큰 값
// -> 만약 j개를 여러 장 구매할 수 없으면 -> P[i]와 P[j] + P[i - j] 중 큰 값

let N = Int(readLine()!)!
let P = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = P

for i in 1...N {
    for j in 1..<i {
        if i % j == 0 { dp[i] = max(dp[i], P[j] * (i / j)) }
        else { dp[i] = max(dp[i], P[j] + dp[i - j]) }
    }
}

print(dp[N])
