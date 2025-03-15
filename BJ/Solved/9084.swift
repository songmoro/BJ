//
//  9084.swift
//  BJ
//
//  Created by 송재훈 on 3/15/25.
//


//3
//2
//1 2
//1000
//3
//1 5 10
//100
//2
//5 7
//22

let T = Int(readLine()!)!

for _ in 0..<T {
    let _ = Int(readLine()!)!
    let coins = readLine()!.split(separator: " ").map { Int(String($0))! }
    let goal = Int(readLine()!)!
    var dp = [Int](repeating: 0, count: 10001)
    
    for coin in coins where coin <= goal {
        dp[coin] = max(dp[coin] + 1, 1)
        
        for i in coin...goal {
            dp[i] += dp[i - coin]
        }
    }
    
    print(dp[goal])
}

//0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
//0 0 0 0 0 1 0 1 0 0  0  0  0  0  0  0  0  0  0  0  0  0  0
//
//0 0 0 0 0 1 0 0 0 0  0  0  0  0  0  0  0  0  0  0  0  0  0 -> 5
//0 0 0 0 0 1 0 0 0 0  1  0  0  0  0  0  0  0  0  0  0  0  0 -> 5
//0 0 0 0 0 1 0 0 0 0  1  0  0  0  0  1  0  0  0  0  0  0  0 -> 5
//0 0 0 0 0 1 0 0 0 0  1  0  0  0  0  1  0  0  0  0  1  0  0 -> 5
//
//0 0 0 0 0 1 0 1 0 0  1  0  0  0  0  1  0  0  0  0  1  0  0 -> 7
//0 0 0 0 0 1 0 1 0 0  1  0  1  0  0  1  0  0  0  0  1  0  0 -> 7
//0 0 0 0 0 1 0 1 0 0  1  0  1  0  1  1  0  0  0  0  1  0  0 -> 7
//0 0 0 0 0 1 0 1 0 0  1  0  1  0  1  1  0  0  0  0  1  0  0 -> 7
