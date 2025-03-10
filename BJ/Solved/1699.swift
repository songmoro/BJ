//
//  1699.swift
//  BJ
//
//  Created by 송재훈 on 1/24/25.
//


let N = Int(readLine()!)!

var dp: [Int] = .init(repeating: Int.max, count: 100001)
(dp[0], dp[1]) = (0, 1)

for i in 2...100000 {
    for j in 1... {
        if (j * j) > i { break }
        
        dp[i] = min(dp[i], dp[i - (j * j)] + 1)
    }
}

print(dp[N])

// 1 = 1
// 2 = 1 + 1
// 3 = 1 + 1 + 1
// 4 = 2
// 5 = 2 + 1
// 6 = 2 + 1 + 1
// 7 = 2 + 1 + 1 + 1
// 8 = 2 + 2
// 9 = 3
//10 = 3 + 1
//11 = 3 + 1 + 1
//12 = 3 + 1 + 1 + 1
//13 = 3 + 2
