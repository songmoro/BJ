//
//  12865.swift
//  BJ
//
//  Created by 송재훈 on 2/10/25.
//


//4 7
//6 13
//4 8
//3 6
//5 12

let NK = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, K) = (NK[0], NK[1])

var things: [(Int, Int)] = (0..<N).map { _ in
    let thing = readLine()!.split(separator: " ").map({ Int($0)! })
    return (thing[0], thing[1])
}

var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: K + 1), count: N + 1)

for i in 1...N {
    let (W, V) = things[i - 1]
    
    for w in 0...K {
        dp[i][w] = (w < W) ? (dp[i - 1][w]) : max(dp[i - 1][w], V + dp[i - 1][w - W])
    }
}

print(dp[N][K])

//7 4
//4 3
//4 4
//1 3
//3 7
//2 1
//2 6
//1 4
