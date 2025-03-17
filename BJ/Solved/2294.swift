//
//  2294.swift
//  BJ
//
//  Created by 송재훈 on 3/17/25.
//


//3 15
//1
//5
//12

// MARK: 0을 만드는 방법은 0개
// -> where i == coin -> [i - coin] -> dp[i] = min(k + 1, 0 + 1) -> dp[i] = 1

// MARK: 만약, 만들 수 없는 수면?
//3 16
//3
//6
//7
// coin = 7, i = 8 -> dp[i] = min(dp[i], dp[i - coin] + 1) -> dp[8] = min(k + 1, k + 1 + 1)

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (nk[0], nk[1])
var coins = [Int]()

for _ in 0..<n {
    let coin = Int(readLine()!)!
    if coin <= k { coins.append(coin) }
}

var dp = [0] + [Int](repeating: k + 1, count: k)

for coin in coins {
    for i in coin...k { dp[i] = min(dp[i], dp[i - coin] + 1) }
}

print(dp[k] == k + 1 ? -1 : dp[k])

//   0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
//   0 0 0 0 0 0 0 0 0 0  0  0  0  0  0  0
//1  0 0 0 0 0 0 0 0 0 0  0  0  0  0  0  0
//1  0 1 1 1 1 1 1 1 1 1  1  1  1  1  1  1 -> dp[i] + dp[j]
//5  0 1 1 1 1 2 2 1 1 1  1  1  1  1  1  1
//5  0 1 1 1 1 2 1 1 1 1  2  1  1  1  1  1
//5  0 1 1 1 1 2 1 1 1 1  2  1  1  1  1  2
//12 0 1 1 1 1 2 1 1 1 1  2  1  2  1  1  1
//12 0 1 1 1 1 2 1 1 1 1  2  1  2  1  1  3 -> dp[12] + dp[3] -> 3

//3 16
//3
//6
//7
//3 6 9 12 15
//6 12
//9 12 15
//6 15
//7 13 14 16

//3
//6
//7
//3 6
//3 7
//6 7
