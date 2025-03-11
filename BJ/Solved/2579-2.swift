//
//  2579-2.swift
//  BJ
//
//  Created by 송재훈 on 3/11/25.
//


//6
//10
//20
//15
//25
//10
//20

// MARK: 값 변화 감시
//var dp = [[Int]](repeating: [-1, -1], count: N + 1) {
//    willSet {
//        print(newValue)
//    }
//}

let N = Int(readLine()!)!
var stairs = [0]

for _ in 0..<N {
    let stair = Int(readLine()!)!
    stairs.append(stair)
}

if N == 1 {
    print(stairs[1])
}
else if N == 2 {
    print(stairs[1] + stairs[2])
}
else {
    var dp = [[Int]](repeating: [-1, -1], count: N + 1)
    (dp[1][0], dp[1][1]) = (stairs[1], 0)
    (dp[2][0], dp[2][1]) = (stairs[2], stairs[1] + stairs[2])
    
    for i in 3...N {
        dp[i][0] = max(dp[i - 2][0], dp[i - 2][1]) + stairs[i]
        dp[i][1] = max(dp[i - 1][0], dp[i - 2][1]) + stairs[i]
    }
    
    print(max(dp[N][0], dp[N][1]))
}

