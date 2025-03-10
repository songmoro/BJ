//
//  14719.swift
//  BJ
//
//  Created by 송재훈 on 1/21/25.
//


//4 4
//3 0 1 4

let HW = readLine()!.split(separator: " ").map { Int(String($0))! }
var world: [[Bool]] = .init(repeating: .init(repeating: false, count: HW[1]), count: HW[0])

let blocks: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

for (w, block) in blocks.enumerated() {
    for h in (HW[0] - block)..<(HW[0]) {
        world[h][w] = true
    }
}

var result = 0

for i in 0..<HW[0] {
    let closed = world[i].enumerated().filter({ $0.element })
    if closed.count <= 1 { continue }
    
    for j in 0..<(closed.count - 1) {
        result += (closed[j + 1].offset - closed[j].offset - 1)
    }
}

print(result)
