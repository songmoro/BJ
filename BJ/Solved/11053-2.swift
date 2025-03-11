//
//  11053-2.swift
//  BJ
//
//  Created by 송재훈 on 3/11/25.
//


//10
//1 100 2 50 60 3 5 6 7 8

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [Int](repeating: 1, count: N + 1)

for i in 0..<N {
    for j in 0..<i {
        if A[i] > A[j] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.max()!)
