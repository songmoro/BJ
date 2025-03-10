//
//  1026.swift
//  BJ
//
//  Created by 송재훈 on 2/13/25.
//


//5
//1 1 1 6 0
//2 7 8 3 1

let N = Int(readLine()!)!
let (A, B) = (readLine()!.split(separator: " ").map({ Int($0)! }), readLine()!.split(separator: " ").map({ Int($0)! }))
let (sortedA, sortedB) = (A.sorted(by: <), B.sorted(by: >))

print(zip(sortedA, sortedB).reduce(0, { $0 + $1.0 * $1.1 }))
