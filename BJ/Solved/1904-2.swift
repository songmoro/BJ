//
//  1904-2.swift
//  BJ
//
//  Created by 송재훈 on 3/14/25.
//


//4

// MARK: 풀이
// 타일은 00 혹은 1
// i번 타일을 만드는 방법은 (i - 2)에 00 타일 붙이기, (i - 1)에 1 타일 붙이기
// -> (i - 2) + (i - 1)

let N = Int(readLine()!)!
var dp = [0, 1, 2] + [Int](repeating: 0, count: N + 2)
for i in 3...(N + 2) { dp[i] = (dp[i - 2] + dp[i - 1]) % 15746 }

print(dp[N])
