//
//  2240-2.swift
//  BJ
//
//  Created by 송재훈 on 3/12/25.
//


//7 2
//2
//1
//1
//2
//2
//1
//1

// MARK: 이동하지 않는 경우 = 처음부터 끝까지 이동하지 않을 때
// MARK: 이동하는 경우 = 이전 경우에서 이동해야 했을 때 || 이번 경우에 이동해야 할 때
// -> 이동 횟수를 하나 써서 이전 경우에 이동하거나 이번 경우에 이동 중 큰 값 선택

let TW = readLine()!.split(separator: " ").map { Int(String($0))! }
let (T, W) = (TW[0], TW[1])

var drop = [Int]()

for _ in 0..<T {
    let input = Int(readLine()!)!
    drop.append(input)
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: W + 1), count: T + 1)

for i in 1...T {
    dp[i][0] = dp[i - 1][0] + (drop[i - 1] == 1 ? 1 : 0)
    
    for j in 1...W {
        dp[i][j] = max(dp[i - 1][j - 1], dp[i - 1][j]) + ((j % 2 == drop[i - 1] - 1) ? 1 : 0)
    }
}

print(dp[T].max()!)
