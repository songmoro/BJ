//
//  15988-2.swift
//  BJ
//
//  Created by 송재훈 on 3/12/25.
//


//3
//4
//7
//10

let T = Int(readLine()!)!
var dp = [0, 1, 2, 4] + [Int](repeating: -1, count: 1000001)

for _ in 0..<T {
    let n = Int(readLine()!)!
    
    if dp[n] == -1 {
        for i in 4...(n + 4) {
            dp[i] = (dp[i - 3] + dp[i - 2] + dp[i - 1]) % 1000000009
        }
    }
    
    print(dp[n])
}
