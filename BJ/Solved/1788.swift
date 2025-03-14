//
//  1788.swift
//  BJ
//
//  Created by 송재훈 on 3/14/25.
//


// MARK: 풀이
// -i번 피보나치는 (-i + 1) + (-i + 2)
// -> 번갈아가며 양수, 음수
// --> -7 = 13
// --> -8 = -21

let n = Int(readLine()!)!

if n == 0 {
    print(0)
    print(0)
}
else {
    let absN = abs(n)
    
    var dp = [0, 1] + [Int](repeating: 0, count: absN)
    
    if absN >= 2 {
        for i in 2...absN {
            dp[i] = (dp[i - 1] + dp[i - 2]) % 1000000000
        }
    }
    
    if n > 0 || absN % 2 == 1 { print(1) }
    else { print(-1) }
    print(dp[absN])
}
