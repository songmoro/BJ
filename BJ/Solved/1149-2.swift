//
//  1149-2.swift
//  BJ
//
//  Created by 송재훈 on 3/11/25.
//


//3
//26 40 83
//49 60 57
//13 89 99

let N = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: N + 1)

for i in 1...N {
    let rgb = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    dp[i][0] = min(dp[i - 1][1], dp[i - 1][2]) + rgb[0]
    dp[i][1] = min(dp[i - 1][0], dp[i - 1][2]) + rgb[1]
    dp[i][2] = min(dp[i - 1][0], dp[i - 1][1]) + rgb[2]
}

print(dp[N].min()!)
