//
//  12852-2.swift
//  BJ
//
//  Created by 송재훈 on 3/11/25.
//


let N = Int(readLine()!)!

if N == 1 {
    print(0)
    print(1)
}
else {
    var dp = [Int](repeating: Int.max, count: N + 1)
    var trace = [Int](repeating: 0, count: N + 1)
    dp[1] = 0
    
    for i in 2...N {
        if i % 3 == 0, dp[i] > (dp[i / 3] + 1) {
            dp[i] = dp[i / 3] + 1
            trace[i] = i / 3
        }
        if i % 2 == 0, dp[i] > (dp[i / 2] + 1) {
            dp[i] = dp[i / 2] + 1
            trace[i] = i / 2
        }
        if dp[i] > (dp[i - 1] + 1) {
            dp[i] = dp[i - 1] + 1
            trace[i] = i - 1
        }
    }
    
    var answer = [String]()
    var current = N
    
    while current != 1 {
        answer.append(String(trace[current]))
        current = trace[current]
    }
    
    print(dp[N])
    print(N, answer.joined(separator: " "))
}