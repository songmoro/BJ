//
//  1912-2.swift
//  BJ
//
//  Created by 송재훈 on 3/11/25.
//


//10
//10 -4 3 1 5 6 -35 12 21 -1

// MARK: i번 째까지 최대 합은 누적합과 누적합 초기화(i번 째 수) 중 큰 값을 선택

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [Int](repeating: -1001, count: n + 1)

for i in 1...n {
    dp[i] = max(numbers[i - 1], dp[i - 1] + numbers[i - 1])
}

print(dp.max()!)
