//
//  1446.swift
//  BJ
//
//  Created by 송재훈 on 1/20/25.
//


//5 150
//0 50 10
//0 50 20
//50 100 10
//100 151 10
//110 140 90

let ND = readLine()!.split(separator: " ").map { Int($0)! }
var shortcuts: [(Int, Int, Int)] = []

for _ in 0..<ND[0] {
    let read = readLine()!.split(separator: " ").map { Int($0)! }
    
    if read[1] <= ND[1] { shortcuts.append((read[0], read[1], read[2])) }
}

var distance = [Int](repeating: Int.max, count: ND[1] + 1)
distance[0] = 0

for i in 0...ND[1] {
    if i > 0 {
        distance[i] = min(distance[i], distance[i - 1] + 1)
    }
    
    shortcuts
        .filter({ i == $0.0 })
        .forEach({ distance[$0.1] = min(distance[$0.1], distance[i] + $0.2) })
}

print(distance[ND[1]])
