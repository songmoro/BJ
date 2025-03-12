//
//  2156-2.swift
//  BJ
//
//  Created by 송재훈 on 3/12/25.
//


//6
//6
//10
//13
//9
//8
//1

let n = Int(readLine()!)!
var wine = [Int]()

for _ in 0..<n {
    let input = Int(readLine()!)!
    wine.append(input)
}

if n <= 2 {
    print(wine.reduce(0, +))
}
else {
    var dp = [[Int]](repeating: [0, 0, 0], count: n + 1)
    
    for i in 1...n {
        dp[i] = [
            dp[i - 1].max()!,
            dp[i - 1][0] + wine[i - 1],
            dp[i - 1][1] + wine[i - 1]
        ]
    }
    
    print(dp[n].max()!)
}
