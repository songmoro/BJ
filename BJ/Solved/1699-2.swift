//
//  1699-2.swift
//  BJ
//
//  Created by 송재훈 on 3/15/25.
//


//7

//0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13
//0, 1, 2, 3, 1, 2, 3, 4, 2, 2,  2,  3,  3,  2

let N = Int(readLine()!)!
var dp = [0, 1] + [Int](repeating: Int.max, count: N + 2)

for i in 2...(N + 1) {
    for j in 1..<i {
        if j * j > i { break }
        
        dp[i] = min(dp[i], dp[i - (j * j)] + 1)
    }
}

print(dp[N])
