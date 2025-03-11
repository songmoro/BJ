//
//  1932-2.swift
//  BJ
//
//  Created by 송재훈 on 3/11/25.
//


//5
//7
//3 8
//8 1 0
//2 7 4 4
//4 5 2 6 5

let n = Int(readLine()!)!
var pyramid = [[Int]]()

for _ in 0..<n {
    let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
    pyramid.append(numbers)
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)
for i in 1...n {
    for j in 0..<i {
        if j == 0 {
            dp[i][j] = dp[i - 1][0] + pyramid[i - 1][0]
        }
        else {
            dp[i][j] = max(dp[i - 1][j - 1], dp[i - 1][j]) + pyramid[i - 1][j]
        }
    }
}

print(dp[n].max()!)
