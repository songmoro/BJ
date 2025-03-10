//
//  2217.swift
//  BJ
//
//  Created by 송재훈 on 2/24/25.
//


//2
//10
//15

// 20

let N = Int(readLine()!)!
var ropes = [Int]()

for _ in 0..<N { ropes.append(Int(readLine()!)!) }
ropes.sort(by: >)

var maxWeight = 0
var (k, w) = (0, 0)

for rope in ropes {
    k += 1
    w += rope
    
    maxWeight = max(min(w / k, rope) * k, maxWeight)
}

print(maxWeight)
