//
//  11055.swift
//  BJ
//
//  Created by 송재훈 on 2/14/25.
//


//6
//10 20 10 30 20 50

//10
//1 100 2 50 60 3 5 6 7 8
// 113

let N = Int(readLine()!)!
let seq = readLine()!.split(separator: " ").map({ Int($0)! })
var dp = seq

for i in 0..<N {
    for j in 0..<i where seq[j] < seq[i] {
        dp[i] = max(dp[i], seq[i] + dp[j])
    }
}

print(dp.max()!)

//
//  10 20 10 30 20  50
//0 10 20 10 30 20  50
//1 10 20 10 30 20  50
//2 10 30 10 30 20  50
//3 10 30 10 60 20  50
//4 10 30 10 60 30 110
//5 10 30 10 60 30 110
//6 10 30 10 60 30 110
