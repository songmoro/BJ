//
//  13305.swift
//  BJ
//
//  Created by 송재훈 on 2/7/25.
//


//4
//2 3 1
//5 2 4 1

let N: Int = Int(readLine()!)!
let distances: [Int] = readLine()!.split(separator: " ").map({ Int($0)! })
let prices: [Int] = readLine()!.split(separator: " ").map({ Int($0)! })

var (minCost, minPrice): (Int, Int) = (0, prices[0])

for i in 0..<(N - 1) {
    minCost += minPrice * distances[i]
    minPrice = min(minPrice, prices[i + 1])
}

print(minCost)

//2 3 1
//5 2 4 1


