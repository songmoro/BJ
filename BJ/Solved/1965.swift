//
//  1965.swift
//  BJ
//
//  Created by 송재훈 on 2/13/25.
//


//8
//1 6 2 5 7 3 5 6
//
// 5

//10
//1 2 3 4 5 6 7 8 9 10
//
// 10

let N = Int(readLine()!)!
let boxes = readLine()!.split(separator: " ").map({ Int($0)! })
var dp: [Int] = .init(repeating: 1, count: N + 1)

for i in 1..<N {
    for j in 0..<i {
        if boxes[j] < boxes[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.max()!)

//8
//1 6 2 5 7 3 5 6

// 1 2 3 4 5 6 7 8
// 1 1 1 1 1 1 1 1
// 1 6 6 6 6 6 6 6
// 1 6 6 6
//
