//
//  1577.swift
//  BJ
//
//  Created by 송재훈 on 2/14/25.
//


//6 6
//2
//0 0 0 1
//6 6 5 6

let NM = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, M, K) = (NM[0], NM[1], Int(readLine()!)!)
var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: M + 1), count: N + 1)
var roads = Set<[Int]>()
dp[0][0] = 1

for _ in 0..<K {
    let road = readLine()!.split(separator: " ").map({ Int($0)! })
    roads.insert([road[0], road[1], road[2], road[3]])
}

for i in 0...N {
    for j in 0...M {
        if i > 0, !roads.contains([i - 1, j, i, j]), !roads.contains([i, j, i - 1, j]) {
            dp[i][j] += dp[i - 1][j]
        }
        if j > 0, !roads.contains([i, j - 1, i, j]), !roads.contains([i, j, i, j - 1]) {
            dp[i][j] += dp[i][j - 1]
        }
    }
}

print(dp[N][M])
