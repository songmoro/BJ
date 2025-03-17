//
//  2011.swift
//  BJ
//
//  Created by 송재훈 on 3/17/25.
//


//25114
// -> "BEAAD", "YAAD", "YAN", "YKD", "BEKD", "BEAN"

// MARK: 풀이
// i번 수로 알파벳이 만들어지는 경우
// 1. password[i] 값은 1, 2, 3, 4, 5, 6, 7, 8, 9 중 하나
// 2. password[i - 1] + password[i] 값이 10 이상, 26 이하
// 3. 그 외 값은 실패
// -> 1번으로 인해 dp[i] = dp[i - 1], 2번으로 인해 dp[i] = dp[i - 2] + dp[i - 1]

//"abcdefghijklmnopqrstuvwxyz".enumerated().forEach { print($0.offset + 1, $0.element) }
//print()
// "BEAAD" -> 2, 5, 1, 1, 4
// "YAAD" -> 25, 1, 1, 4
// "YAN" -> 25, 1, 14
// "YKD" -> 25, 11, 4
// "BEKD" -> 2, 5, 11, 4
// "BEAN" -> 2, 5, 1, 14

//  2 5 1 1 4
//2 1 0 0 0 0 -> (2)
//5 1 2 0 0 0 -> (2, 5), (25)
//1 1 2 2 0 0 -> (2, 5, 1), (25, 1)
//1 1 2 2 4 0 -> (2, 5, 1, 1), (2, 5, 11), (25, 1, 1), (25, 11)
//4 1 2 2 4 6 -> (2, 5, 1, 1, 4), (2, 5, 1, 14), (2, 5, 11, 4), (25, 1, 1, 4), (25, 1, 14), (25, 11, 4)

//  1 0 1 0
//1 1 0 0 0 -> (1)
//2 1 1 0 0 -> (10)
//3 1 1 1 0 -> (10, 1)
//4 1 1 1 1 -> (10, 10)

let password = ["-1"] + readLine()!.map { String($0) }

if password[0] == "0" { print(0) }
else {
    var dp = [1] + [Int](repeating: 0, count: password.count)
    
    for i in 1..<password.count {
        if "1"..."9" ~= password[i] { dp[i] = dp[i - 1] }
        if "10"..."26" ~= password[i - 1] + password[i] { dp[i] += dp[i - 2] }
        
        dp[i] %= 1000000
    }
    
    print(dp[password.count - 1])
}
