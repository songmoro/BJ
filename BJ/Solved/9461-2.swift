//
//  9461-2.swift
//  BJ
//
//  Created by 송재훈 on 3/11/25.
//


//2
//6
//12

let T = Int(readLine()!)!
var P = [0, 1, 1, 1, 2, 2, 3, 4, 5, 7, 9] + [Int](repeating: 0, count: 100)

for i in 10...100 { P[i] = P[i - 1] + P[i - 5] }

for _ in 0..<T {
    let N = Int(readLine()!)!
    print(P[N])
}
