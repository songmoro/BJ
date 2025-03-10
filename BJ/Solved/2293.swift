//
//  2293.swift
//  BJ
//
//  Created by 송재훈 on 2/14/25.
//


//3 10
//1
//2
//5

let nk = readLine()!.split(separator: " ").map({ Int($0)! })
let (n, k) = (nk[0], nk[1])
var coins = [Int]()
var dp: [Int] = .init(repeating: 0, count: k + 1)
dp[0] = 1

for _ in 0..<n {
    let coin = Int(readLine()!)!
    if coin <= k { coins.append(coin) }
}

for coin in coins {
    for i in coin...k {
        if !dp[i].addingReportingOverflow(dp[i - coin]).overflow {
            dp[i] += dp[i - coin]
        }
    }
}

print(dp[k])
