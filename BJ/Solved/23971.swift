//
//  23971.swift
//  BJ
//
//  Created by 송재훈 on 1/20/25.
//


// 5 4 1 1 -> 6

let read = readLine()!.split(separator: " ").map({ Int(String($0))! })
let (H, W, N, M) = (read[0], read[1], read[2], read[3])

var result = 0

stride(from: 0, to: H, by: N + 1).forEach { _ in
    stride(from: 0, to: W, by: M + 1).forEach { _ in
        result += 1
    }
}

print(result)
