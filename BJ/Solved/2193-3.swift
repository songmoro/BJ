//
//  2193-3.swift
//  BJ
//
//  Created by 송재훈 on 3/11/25.
//


//3

// MARK: 풀이
//    마지막이 0이면 0, 1을 붙일 수 있음
//    마지막이 1이면 0을 붙일 수 있음
//    -> 2차원 배열에 마지막이 0인 수, 1인 수를 넣고,
//       [i][0] = [i - 1][0] + [i - 1][1]
//       [i][1] = [i - 1][0]

let N = Int(readLine()!)!
var dp = [[0, 0], [1, 0], [1, 0]] + [[Int]](repeating: [0, 0], count: N + 2)
for i in 3...(N + 2) { dp[i] = [dp[i - 1][0] + dp[i - 1][1], dp[i - 1][0]] }

print(dp[N][0] + dp[N][1])
