//
//  9465-2.swift
//  BJ
//
//  Created by 송재훈 on 3/14/25.
//

//2
//5
//50 10 100 20 40
//30 50 70 10 60
//7
//10 30 10 50 100 20 40
//20 40 30 50 60 20 80

let T = Int(readLine()!)!

for _ in 0..<T {
    let N = Int(readLine()!)!
    var stickers = [[Int]]()
    
    for _ in 0...1 {
        let sticker = readLine()!.split(separator: " ").map { Int(String($0))! }
        stickers.append(sticker)
    }
    
    var dp = [[Int]](repeating: [0, 0], count: N + 1)
    
    for i in 1...N {
        dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + stickers[0][i - 1])
        dp[i][1] = max(dp[i - 1][0] + stickers[1][i - 1], dp[i - 1][1])
    }
    
    print(dp[N].max()!)
}

